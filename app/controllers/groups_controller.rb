class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group, only: [:edit, :update, :close, :link, :buy, :add_to_order]
  # protect_from_forgery prepend: true

  require 'rqrcode'

  def index
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
    @group = current_user.groups.build
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
    @group
    @product = Product.find_by(name: params[:products])
    @option = Option.find_by(name: params[:options])
    @order_item = @product.build_order_item
    # @order_item.options


    # @order = current_user.order.build
    # @order.save()
    # params[:products, :options]
    # params[:options]
  end


  
  def link
    @link = edit_group_url
    qrcode = RQRCode::QRCode.new(@link)
  end

  private
  def find_group
    @group = Group.find_by(id: params[:id])
  end

  def group_params
    clean_params = params.require(:group).permit(:title, :description, :address, :phone, :is_active, :start_time, :end_time, :is_public, :shop_photo, products_attributes:[:name, :price, :_destroy], options_attributes:[:name, :price, :_destroy])
  end
end
