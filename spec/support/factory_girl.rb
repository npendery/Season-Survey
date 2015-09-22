require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    image 'https://www.image.png'
    description 'item description'
    purchase_url 'https://www.purchase.com'
    price_range_id 3
    category_id 1
  end

  factory :category do
    sequence(:name) { |n| "category #{n}" }
  end
end
