require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "users#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :category do
    name 'Fashion'
  end

  factory :item do
    sequence(:name) { |n| "Itemy #{n}" }
    image 'https://www.image.png'
    description 'item description'
    category
    user
  end

  factory :review do
    description 'So awesome!'
    rating 5
    item
    user
  end
end
