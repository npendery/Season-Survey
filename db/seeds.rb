require 'faker'
require "as-duration"

Category.create(name: "food", image: "http://i.imgur.com/PZjSwig.jpg?1")
Category.create(name: "fun", image: "http://i.imgur.com/N8TLfM3.jpg")
Category.create(name: "fashion", image: "http://i.imgur.com/q3biltH.jpg")

Item.create(name: "hot chocolate", image: "adkjf.png",
            category_id: 1, description: "amazazing",
            purchase_url: "www.dfjhs.com", user_id: 1)
Item.create(name: "cold chocolate", image: "asdfdkjf.png",
            category_id: 1, description: "not", user_id: 1)

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
