# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "json"
# require "open-uri"

# url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s"
# cocktail_serialized = URI.open(url).read
# cocktail = JSON.parse(cocktail_serialized)

# puts "#{cocktail["name"]} - #{cocktail["bio"]}"

puts "Destruction de la base User"
Alcool.destroy_all
# Cocktail.destroy_all


alcool_1 = Alcool.create(name: "Gin")
alcool_1.save!
alcool_2 = Alcool.create(name: "campari")
alcool_2.save!
alcool_3 = Alcool.create(name: "Liqueur")
alcool_3.save!
alcool_4 = Alcool.create(name: "vermouth")
alcool_4.save!
alcool_5 = Alcool.create(name: "Angostura")
alcool_5.save!
alcool_6 = Alcool.create(name: "Triple Sec")
alcool_6.save!
alcool_7 = Alcool.create(name: "Beer")
alcool_7.save!
alcool_8 = Alcool.create(name: "amaretto")
alcool_8.save!
alcool_9 = Alcool.create(name: "cognac")
alcool_9.save!
alcool_10 = Alcool.create(name: "Brandy")
alcool_10.save!
alcool_11 = Alcool.create(name: "Cachaça")
alcool_11.save!
alcool_12 = Alcool.create(name: "Rhum")
alcool_12.save!
alcool_13 = Alcool.create(name: "Tequila")
alcool_13.save!
alcool_14 = Alcool.create(name: "Kahlua")
alcool_14.save!
alcool_15 = Alcool.create(name: "Vodka")
alcool_15.save!
alcool_16 = Alcool.create(name: "Whisky")
alcool_16.save!
alcool_17 = Alcool.create(name: "Curacao")
alcool_17.save!


puts 'creating 17 alcool'

puts "creating cocktails"
Cocktail.destroy_all
def cocktail_seed
  cocktails = RestClient.get("www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka")
  pokemons_array = JSON.parse(cocktails)["results"]
  cocktails_array.each do |cocktail|
      pokemon = RestClient.get("#{cocktail["url"]}")
      pokemon_name = JSON.parse(cocktail)["name"]
      cocktail_sprite = JSON.parse(cocktail)["sprites"]["other"]["official-artwork"]["front_default"]
      cocktail_weight = JSON.parse(cocktail)["weight"]
      cocktail_height = JSON.parse(cocktail)["height"]
      cocktail_type = JSON.parse(cocktail)["types"][0]["type"]["name"]
      cocktail_order = JSON.parse(cocktail)["order"]
      Cocktail.create!(
        name: cocktail_name,
        weight: cocktail_weight,
        height: cocktail_height,
        sprites: cocktail_sprite,
        types: cocktail_type,
        order: cocktail_order
      )
    end
end
cocktail_seed()
puts "Seed ok"
