# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "food", image: "http://i.imgur.com/PZjSwig.jpg?1")
Category.create(name: "fun", image: "http://i.imgur.com/N8TLfM3.jpg")
Category.create(name: "fashion", image: "http://i.imgur.com/q3biltH.jpg")

Item.create(name: "hot chocolate", image: "adkjf.png",
            category_id: 1, description: "amazazing",
            purchase_url: "www.dfjhs.com")
Item.create(name: "cold chocolate", image: "asdfdkjf.png",
            category_id: 1, description: "not")
