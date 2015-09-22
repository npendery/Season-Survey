# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "food")
Category.create(name: "fun")
Category.create(name: "clothes")

Item.create(name: "hot chocolate", image: "adkjf.png",
            category_id: 1, description: "amazazing",
            purchase_url: "www.dfjhs.com", price_range_id: 1)
Item.create(name: "cold chocolate", image: "asdfdkjf.png",
            category_id: 1, description: "not",
            purchase_url: "www.dfjsdhs.com", price_range_id: 2)
