# Preview all emails at http://localhost:3000/rails/mailers/order
class OrderPreview < ActionMailer::Preview
  def confirm_email
    order = FactoryBot.create(:order)
    OrderMailer.with(order: order).confirm_email
  end
end
