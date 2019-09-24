namespace :order do
  desc '產生兩筆訂單'
  task :generate => :environment do
    puts "generating orders..."
    Order.create(group_id:1, buyer_id:1)
    Order.create(group_id:1, buyer_id:2)
    p1 = Product.first
    p2 = Product.second
    o1 = Option.first
    o2 = Option.second
    oi1 = OrderItem.new(order_id:1, product_id:1)
    oi1.options = [o1,o2]
    oi1.save
    oi2 = OrderItem.new(order_id:2, product_id:3)
    oi2.options = [o2]
    oi2.save
    puts "done"
  end
end
