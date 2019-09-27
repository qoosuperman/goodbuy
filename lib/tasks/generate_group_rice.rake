namespace :group do
  desc '產生鬍鬚張菜單'
  task :generate_rice => :environment do
    Group.create(
      title: "鬍鬚張",
      description: "好吃 der",
      address: "100台北市中正區忠孝西路一段49號B1",
      phone: "02 2361 3055",
      is_active: false,
      is_public: true,
      user_id: 1
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "滷肉飯便當", price: "80"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "雞肉飯便當", price: "80"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "招牌便當", price: "90"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "蒜泥白肉便當", price: "95"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "雞魚雙寶便當", price: "99"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "炒青菜", price: "50"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "玉米濃湯", price: "55"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "貢丸湯", price: "45"
    )
    Group.where(title: "鬍鬚張").find_by(is_public: true).products.create(
      name: "菜頭湯", price: "40"
    )
  end
end
