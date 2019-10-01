class OrderMailer < ApplicationMailer
  def confirm_email
    @order = params[:order]
    mail(to: @order.buyer.email, subject: "您的訂單#{@order.trade_no}已繳費")
    # mail(to: 'qoosuperman@gmail.com', subject: "您的訂單已繳費")
  end
end
