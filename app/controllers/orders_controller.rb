class OrdersController < ApplicationController
  before_action :find_order

  def show
    #以下金流部分
    @merchan_trade_no = order_generator
    @time = time_generator
    @total_amount = @order.total_price
    @item_name = @order.item_name
    @return_url = 'http://da202e30.ngrok.io/api/feedback'


    @check_mac_value = Ecpay::Invoice::CreateMacValue.new(raw_params).run
  end

  private
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

  def find_order
    @order = Order.find_by(id: params[:id])
  end

  def raw_params
  {
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
  end
end
