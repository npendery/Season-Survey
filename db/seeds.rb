[
  'Clothing',
  'Food',
  'Fun'
].each do |category_name|
  Category.find_or_create_by!(name: category_name)
end
