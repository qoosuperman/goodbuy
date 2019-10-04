class PostManJob < ApplicationJob
  queue_as :default

  def perform(order)
    OrderMailer.with(order: order).confirm_email.deliver_later
  end
end
