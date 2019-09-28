namespace :order do
  desc '產生3筆訂單'
  task :generate => :environment do
    puts "generating orders..."

    Group.create(
      title: "我揪的50嵐",
      description: "不爽喝別喝",
      address: "公司旁邊新開的",
      phone: "12345678",
      is_active: true,
      is_public: false,
      user_id: 2
    )
    Group.find(4).products.create(
      name: "綠茶", price: "30"
    )
    Group.find(4).products.create(
      name: "紅茶", price: "30"
    )
    Group.find(4).products.create(
      name: "四季春", price: "30"
    )
    Group.find(4).products.create(
      name: "黃金烏龍", price: "30"
    )
    Group.find(4).products.create(
      name: "檸檬紅茶", price: "40"
    )
    Group.find(4).products.create(
      name: "八冰綠", price: "50"
    )
    Group.find(4).products.create(
      name: "鮮柚綠", price: "60"
    )
    Group.find(4).products.create(
      name: "紅茶拿鐵", price: "60"
    )
    Group.find(4).products.create(
      name: "綠茶拿鐵", price: "60"
    )
    Group.find(4).products.create(
      name: "多多綠", price: "50"
    )
    Group.find(4).products.create(
      name: "奶茶", price: "40"
    )

    Group.find(4).options.create(
      name: "加珍珠", price: "10"
    )
    Group.find(4).options.create(
      name: "加椰果", price: "10"
    )
    Group.find(4).options.create(
      name: "少糖", price: "0"
    )
    Group.find(4).options.create(
      name: "微糖", price: "0"
    )
    Group.find(4).options.create(
      name: "無糖", price: "0"
    )
    Group.find(4).options.create(
      name: "少冰", price: "0"
    )
    Group.find(4).options.create(
      name: "微冰", price: "0"
    )
    Group.find(4).options.create(
      name: "去冰", price: "0"
    )

    p1 = Group.find(4).products.first
    p2 = Group.find(4).products.second
    p3 = Group.find(4).products.third

    option1 = Group.find(4).options.first
    option2 = Group.find(4).options.second
    option3 = Group.find(4).options.third
    option4 = Group.find(4).options[7]

    o1 = Order.create(group_id:4, buyer_id:2)
    oi1 = o1.order_items.new(product_id: p1.id)
    oi1.options = [option1, option2, option3]
    oi1.save

    o2 = Order.create(group_id:4, buyer_id:3)
    oi2 = o2.order_items.new(product_id: p2.id)
    oi2.options = [option1, option4]
    oi2.save

    o3 = Order.create(group_id:4, buyer_id:4)
    oi3 = o3.order_items.new(product_id: p3.id)
    oi3.options = [option1, option3, option4]
    oi3.save


    puts "done"
  end
end
1