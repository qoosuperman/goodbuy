# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: "www@gmail",
  encrypted_password: "123456",
  name: "public",
  nick_name: "public",
)
Group.create(
  title: "50嵐",
  description: "好喝 der",
  address: "我家樓下",
  phone: "55688",
  is_active: false,
  is_public: true,
  user_id: 1
)
Group.where(title: "50嵐").find_by(is_public: true).products.create(
  name: "奶茶", price: "40"
)
Group.where(title: "50嵐").find_by(is_public: true).products.create(
  name: "四季春", price: "30"
)
Group.where(title: "50嵐").find_by(is_public: true).products.create(
  name: "紅茶", price: "30"
)
Group.where(title: "50嵐").find_by(is_public: true).options.create(
  name: "加珍珠", price: "10"
)
Group.where(title: "50嵐").find_by(is_public: true).options.create(
  name: "加椰果", price: "10"
)
Group.where(title: "50嵐").find_by(is_public: true).options.create(
  name: "微糖", price: "0"
)
Group.where(title: "50嵐").find_by(is_public: true).options.create(
  name: "微冰", price: "0"
)
Group.where(title: "50嵐").find_by(is_public: true).options.create(
  name: "少糖", price: "0"
)
Group.where(title: "50嵐").find_by(is_public: true).options.create(
  name: "少冰", price: "0"
)

