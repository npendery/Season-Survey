Category.create(name: "food", image: "http://i.imgur.com/PZjSwig.jpg?1")
Category.create(name: "fun", image: "http://i.imgur.com/N8TLfM3.jpg")
Category.create(name: "fashion", image: "http://i.imgur.com/q3biltH.jpg")

Item.create(name: "hot chocolate", image: "adkjf.png",
            category_id: 1, description: "amazazing",
            purchase_url: "www.dfjhs.com")
Item.create(name: "cold chocolate", image: "asdfdkjf.png",
            category_id: 1, description: "not")
# 
# [
#   'Fashion',
#   'Food',
#   'Fun'
# ].each do |category_name|
#   Category.find_or_create_by!(name: category_name)
# end
