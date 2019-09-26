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
    order = Order.create(group: @group , buyer: current_user)

    params[:item].each do |i|
      product = Product.find_by(id: i["product"])
      
      order_item = OrderItem.create(order_id: order.id, product: product)
      
      i["options"].split(",").each do |option|
        OptionOrderItemLog.create(option_id: option.to_i, order_item_id: order_item.id)
      end
    end

    #以下金流部分
    @merchan_trade_no = order_generator
    @time = time_generator
    @total_amount = order.total_price
    @item_name = order.item_name
    @return_url = 'http://da202e30.ngrok.io/api/feedback'
    raw_params = {
      'MerchantID' => "2000132",
      'MerchantTradeNo' => @merchan_trade_no,
      'MerchantTradeDate' => @time,
      'PaymentType' => 'aio',
      'TotalAmount' => @total_amount,
      'TradeDesc' => 'Goodbuy 團購網',
      'ItemName' => @item_name,
      'ReturnURL' => @return_url ,
      'ChoosePayment' => 'Credit',
      'EncryptType' => 1
      }

    @check_mac_value = Ecpay::Invoice::CreateMacValue.new(raw_params).run

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

  def order_generator
    year = Time.now.year
    month = Time.now.month
    day = Time.now.day
    serial = [*"A".."Z", *0..9].sample(8).join
    "%0d%02d%02d%s" % [year, month, day, serial]
  end

  def time_generator
    t = Time.now
    t.strftime("%Y/%m/%d %T")  
  end
end
