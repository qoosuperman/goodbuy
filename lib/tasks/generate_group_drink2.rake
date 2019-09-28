namespace :group do
  desc '產生狐狸先生菜單'
  task :generate_drink2 => :environment do
    Group.create(
      title: "狐狸先生",
      description: "好喝 der",
      address: "我家樓下",
      phone: "55688",
      is_active: false,
      is_public: true,
      user_id: 1
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "綠茶", price: "30"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "紅茶", price: "30"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "四季春", price: "30"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "黃金烏龍", price: "30"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "檸檬紅茶", price: "40"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "八冰綠", price: "50"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "鮮柚綠", price: "60"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "紅茶拿鐵", price: "60"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "綠茶拿鐵", price: "60"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "多多綠", price: "50"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).products.create(
      name: "奶茶", price: "40"
    )

    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "加蜜珍珠", price: "10"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "加黑糖椰果", price: "10"
    )

    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "少糖", price: "0"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "微糖", price: "0"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "無糖", price: "0"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "少冰", price: "0"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "微冰", price: "0"
    )
    Group.where(title: "狐狸先生").find_by(is_public: true).options.create(
      name: "去冰", price: "0"
    )
  end
end
