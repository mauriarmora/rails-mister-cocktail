require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying all previous data'
Ingredient.destroy_all
Cocktail.destroy_all

ingredient_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
open_ingredients = open(ingredient_url).read
ingredients = JSON.parse(open_ingredients)

ingredients['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
  puts 'Creating ingredients'
end

cocktails_url = 'https://gist.githubusercontent.com/renandanton/8d99dab65bf9fb5b4465ded7ab73a7df/raw/2c5e0480bd239f76b055bb09f236f365e1530634/cocktails.json'
open_cocktails = open(cocktails_url).read
cocktails = JSON.parse(open_cocktails)

cocktails['cocktails'].each do |cocktail|
  Cocktail.create(name: cocktail['name'])
  puts 'Creating cocktails'
end

10.times do
  Dose.create(description: '15cl of gin')
  puts 'Creating doses'
end
