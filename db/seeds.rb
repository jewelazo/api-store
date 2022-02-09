require "json"

# Parse data from category.json to hash ruby with symbols as keys
categories_data=JSON.parse(File.read("db/data/category.json"), symbolize_names: true) 

# Parse data from product.json to hash ruby with symbols as keys
products_data=JSON.parse(File.read("db/data/product.json"), symbolize_names: true)

puts "Start seeding"

# When  rails db:seed is executed again ,first delete all products and then delete category data
# because model Product is dependent from model Category,make this to avoid errors
Product.destroy_all
Category.destroy_all

puts "Start seeding categories"

# From each element from hashes list categories_data, I create a new category
categories_data.each do |category_data|
    new_category = Category.new(category_data)
    puts "Category not created. Errors: #{new_category.errors.full_messages}" unless new_category.save

end
puts "Finish seeding categories"


puts "Start seeding products"
# From each category stored in Category table, I select all products which belongs to that category and then is created.
all_categories=Category.all
all_categories.each do |category|
    category_products_data=products_data.select { |product| product[:category]==category.id}
    category_products_data.each do |category_product_data|
        product_data=category_product_data.slice(:name, :url_image, :price, :discount)
        new_product=Product.new(product_data)
        new_product.category=category
        puts "Product not created. Errors: #{new_product.errors.full_messages}" unless new_product.save
    end

end


puts "Finish seeding products"
