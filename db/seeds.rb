[
  'Clothing',
  'Food',
  'Fun'
].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end

Item.create(name: "hot chocolate", image: "adkjf.png",
            category_id: 1, description: "amazazing",
            purchase_url: "www.dfjhs.com")
Item.create(name: "cold chocolate", image: "asdfdkjf.png",
            category_id: 1, description: "not")
