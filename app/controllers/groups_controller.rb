class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: [:edit, :update, :close, :link, :buy, :show, :checkout, :follow, :delete_follow]
  before_action :validate_group_owner, only: [:edit, :close, :update]
  before_action :validate_group_active, only: [:buy, :edit]

  def show
  end

  def my
    @groups = current_user.groups
  end

  def attend
    @groups = Order.where(buyer_id: current_user.id).map{ |order| order.group }.sort_by(&:created_at).reverse!.sort_by{ |group| group.is_active ? 0 : 1 }
  end

  def public
    @groups = Group.where(is_public: true)
  end

  def new
    if params[:group_id]
      @group = Group.find_by(id: params[:group_id])
      @group = current_user.groups.build(@group.as_json)
    else
      @group = current_user.groups.build
    end
  end

  def edit 
  end

  def update
    if @group.update(group_params)
      redirect_to my_groups_path
    else
      render :edit
    end
  end

  def create
    # 如果是用開過的團，要把 products 跟 options 裡面的 id 用掉
    group = group_params.permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, :shop_photo, products_attributes:[:name, :price, :_destroy], options_attributes:[:name, :price, :_destroy])
    @group = current_user.groups.build(group)
    if @group.save
      redirect_to link_group_path(@group.id)
    else
      render :new
    end
  end

  def close
    @group.update(is_active: false, end_time: Time.now)
    redirect_to my_groups_path
  end


  def buy
    @products = @group.products
    @options = @group.options
  end

  def checkout
    order = Order.create(group: @group , buyer: current_user)

    params[:item].each do |i|
      product = Product.find_by(id: i["product"])
      
      order_item = OrderItem.create(order_id: order.id, product: product)
      
      i["options"].split(",").each do |option|
        OptionOrderItemLog.create(option_id: option.to_i, order_item_id: order_item.id)
      end
    end

    redirect_to order_path(order.id)
  end
  
  def link
    @link = buy_group_url
    respond_to do |format|
      format.html
      format.js
    end
  end


  def follow
    follow = current_user.follows.new(group_id: @group.id)
    if follow.save
      @ajax_result =  t('controllers.groups.follow.result')
      respond_to do |format|
        format.js
      end
    else
      @ajax_result = follow.errors.full_messages.join(', ')
    end
  end

  def show_follow
    @groups = current_user.followed_groups
  end

  def delete_follow
    current_user.followed_groups.delete(@group)
    @ajax_result =  t('controllers.groups.unfollow.result')
    respond_to do |format|
      format.js
    end
  end



  private
  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def group_params
    clean_params = params.require(:group).permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, :shop_photo, products_attributes:[:id, :name, :price, :_destroy], options_attributes:[:id, :name, :price, :_destroy])
  end

  def validate_group_owner
    if @group.user_id != current_user.id
      redirect_to my_groups_path, notice: "只有團主可以編輯/結單喔！"
    end
  end

  def validate_group_active
    unless @group.is_active 
      redirect_to my_groups_path, notice: "這個團已經結單囉！"
    end
  end

end
