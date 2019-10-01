class OrderMailer < ApplicationMailer
  def order_confirm
    mail(to: @order.buyer.email, subject: "您的訂單#{@order.trade_no}")
  end
end
