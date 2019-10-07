# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: "qqq@gmail",
  password: "456789",
  
  name: "public",
  nick_name: "public",
)
User.create(
  email: "eee@gmail",
  password: "234567",
  name: "QOO",
  nick_name: "QOO超人",
)
User.create(
  email: "www@gmail",
  password: "123456",
  name: "崎玉",
  nick_name: "一拳超人",
)
User.create(
  email: "rrr@gmail",
  password: "345678",
  name: "小明",
  nick_name: "最常被Cue的那位",
)


