# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"


puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."
restaurants_data = [
  { name: "Mc Donalds", address: "123 Main St", phone_number: "555-1234", category: "Italian" },
  { name: "KFC", address: "456 Elm St", phone_number: "555-5678", category: "Mexican" },
  { name: "Arturos", address: "789 Oak St", phone_number: "555-9012", category: "Chinese" },
  { name: "Burger king", address: "321 Maple St", phone_number: "555-3456", category: "American" },
  { name: "Wendys", address: "654 Pine St", phone_number: "555-7890", category: "Japanese" }
]

restaurants_data.each do |restaurant_data|
  restaurant = Restaurant.create!(restaurant_data)
  puts "Created restaurant: #{restaurant.name}"
  review = Review.create!(rating:(0..5).to_a.sample, content:Faker::Book.title, restaurant_id: restaurant.id)
end
