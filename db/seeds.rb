# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#イベント
Event.create(name: '焼肉',
             place: '牛角つくば駅前店',
             month: 1,
               day: 1,
            course: 0)
Event.create(name: 'サイゼイア',
             place: '研究学園駅前店',
             month: 2,
               day: 2,
               course: 1)
Event.create(name: 'バーミアン',
             place: '大学会館店',
             month: 3,
               day: 3,
               course: 0)
Event.create(name: 'くらくら寿司',
             place: '平砂店',
             month: 4,
               day: 4,
               course:1)
               


  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "student_id"
    t.boolean  "student"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "password"
    t.string   "course"
  end
  
  
# ユーザー
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             student_id: 111,
             student: true,
             course: coins,
             created_at: Time.zone.now,
             updated_at: Time.zone.now)

#99.times do |n|
#  name  = Faker::Name.name
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
#  User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
#end

# リレーションシップ
user  = users.first
following = event[1..4]
following.each { |followed| user.follow(followed) }
#followers.each { |follower| follower.follow(user) }