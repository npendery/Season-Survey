require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "users#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :category do
    name 'food'
  end

  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    image 'https://www.image.png'
    description 'item description'
  end

end
