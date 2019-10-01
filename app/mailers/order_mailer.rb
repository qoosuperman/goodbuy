class OrderMailer < ApplicationMailer
  def confirm_email
    @order = params[:order]
    mail(to: @order.buyer.email, subject: "您的訂單已繳費")
  end
end
