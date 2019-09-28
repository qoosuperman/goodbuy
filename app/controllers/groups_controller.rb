class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: [:edit, :update, :close, :link, :buy, :show, :checkout]
  

  require 'rqrcode'

  def index
  end

  def show
  end

  def my
    @groups = current_user.groups
  end

  def attend
    @groups = Order.where(buyer_id: current_user.id).map{ |order| order.group }
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
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to link_group_path(@group.id)
    else
      render :new
    end
  end

  def close
    @group.update(is_active: false)
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
  end

  private
  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def group_params
    clean_params = params.require(:group).permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, :shop_photo, products_attributes:[:id, :name, :price, :_destroy], options_attributes:[:id, :name, :price, :_destroy])
  end


end
