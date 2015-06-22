# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  User.create! name: name,
    email: email,
    role: 0,
    password: "123456",
    password_confirmation: "123456"
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}

50.times do
  title = Faker::Name.title
  publish_date = Faker::Date.backward(14)
  page = Faker::Number.number(3)
  Book.create! title: title,
    publish_date: publish_date,
    page: page
end

10.times do
  name = Faker::Name.name
  Author.create! name: name
end

10.times do
  name = Faker::Commerce.department
  Category.create! name: name
end
