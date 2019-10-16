namespace :group do
  desc '產生阜杭豆漿菜單'
  task :generate_breakfast => :environment do
    Group.create(
      title: "阜杭豆漿",
      description: "一定要試試看厚餅蛋油條!!",
      address: "台北市中正區忠孝東路一段108號",
      phone: "(02)2392-2175",
      is_active: false,
      is_public: true,
      user_id: 1
    )
    
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "厚燒餅", price: "28"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "厚餅夾蛋", price: "38"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "厚餅油條", price: "50"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "厚餅蛋夾油條", price: "60"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "薄燒餅", price: "22"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "薄餅夾蛋", price: "32"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "薄餅油條", price: "44"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "薄餅蛋夾油條", price: "54"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "蛋餅", price: "28"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "蘿蔔絲餅", price: "28"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "鹹飯糰", price: "40"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "甜飯糰", price: "35"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "焦糖甜餅", price: "28"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "豆漿", price: "25"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "米漿", price: "25"
    )
    Group.find_by(title: "阜杭豆漿", is_public: true).products.create(
      name: "鹹豆漿", price: "30"
    )
  
  end
end
