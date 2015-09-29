require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "users#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    role 'member'
  end

  factory :category do
    sequence(:name) { |n| "Fashion #{n}" }
  end

  factory :item do
    sequence(:name) { |n| "Item #{n}" }
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
