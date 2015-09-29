require 'faker'
require "as-duration"

Category.create(name: "food", image: "http://i.imgur.com/VeqKQEa.jpg")
Category.create(name: "fun", image: "http://i.imgur.com/6VyP8N6.jpg")
Category.create(name: "fashion", image: "http://i.imgur.com/5BdS7Kt.jpg")

200.times do
  Item.create(
    name: Faker::App.name,
    image: Faker::Avatar.image,
    category_id: Faker::Number.between(1, 3),
    description: Faker::Hacker.ingverb,
    purchase_url: Faker::Internet.url,
    user_id: Faker::Number.between(1, 20)
  )
end

200.times do
  User.create(
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password(60),
    sign_in_count: Faker::Number.between(1, 3),
    created_at: Faker::Time.between(DateTime.now - 2, DateTime.now - 1),
    updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now)
  )
end
