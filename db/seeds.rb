
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
require "json"
require "rest-client"


puts "Destruction de la base User"
Alcool.destroy_all
Cocktail.destroy_all

alcool_1 = Alcool.create(name: "Gin", alt: 'Gin')
alcool_1.save!
alcool_2 = Alcool.create(name: "Campari", alt: 'Campari')
alcool_2.save!
alcool_3 = Alcool.create(name: "Rhum", alt: 'Rum')
alcool_3.save!
alcool_4 = Alcool.create(name: "Light Rhum", alt: 'Light rum')
alcool_4.save!
alcool_5 = Alcool.create(name: "Dark Rhum", alt: 'Dark rum')
alcool_5.save!
alcool_6 = Alcool.create(name: "Tequila", alt: 'Tequila')
alcool_6.save!
# alcool_3 = Alcool.create(name: "Liqueur")
alcool_7 = Alcool.create(name: "Vodka", alt: 'Vodka')
alcool_7.save!
alcool_8 = Alcool.create(name: "Whisky", alt: 'Whiskey')
alcool_8.save!
alcool_8_1 = Alcool.create(name: "Blended Whisky", alt: 'Blended whiskey')
alcool_8_1.save!
# alcool_3.save!
alcool_9 = Alcool.create(name: "Vermouth", alt: 'Vermouth')
alcool_9.save!
# alcool_5 = Alcool.create(name: "Angostura")
alcool_10 = Alcool.create(name: "Scotch", alt: 'Scotch')
alcool_10.save!
# alcool_5.save!
alcool_11 = Alcool.create(name: "Triple Sec", alt: 'Triple Sec')
alcool_11.save!
alcool_12 = Alcool.create(name: "Beer", alt: 'Beer')
alcool_12.save!
alcool_13 = Alcool.create(name: "Amaretto", alt: 'Amaretto')
alcool_13.save!
alcool_14 = Alcool.create(name: "Cognac", alt: 'Cognac')
alcool_14.save!
alcool_15 = Alcool.create(name: "Brandy", alt: 'Brandy')
alcool_15.save!
alcool_17 = Alcool.create(name: "Kahlua", alt: 'Kahlua')
alcool_17.save!



puts 'created 15 alcool'

puts "creating cocktails"


# cocktails = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/random.php")
# cocktails_array = JSON.parse(cocktails)["drinks"]
# puts cocktails_array
# cocktails_array.each do |cocktail|
# cocktail = RestClient.get("#{cocktail["url"]}")s

# alcools = ['', '', '', '', '', '', 'cognac', 'Vodka', '', '', '', '','', '']


def scotch_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=scotch").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
    cocktails_name.gsub!("'", '%27')
    cocktails_name.gsub!("é", 'e')
      names.push(cocktails_name)
  end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  scotch_seed()
puts 'Seed scotch ends'

def vodka_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=vodka").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
    cocktails_name.gsub!("'", '%27')
    cocktails_name.gsub!("é", 'e')
      names.push(cocktails_name)
  end
  # puts
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  vodka_seed()
puts 'Seed vodka ends'



def coctail_seed
#   cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=cognac").read
#   cocktails_name = JSON.parse(cocktailsname_array)
# # end
  names = ['ABC', 'Adam & Eve', 'Adios Amigos Cocktail', 'Apple Highball', "Cocktail Horse%27s Neck", 'French Connection', 'sidecar']
#   cocktails_name['drinks'].each do |name|
#     cocktails_name = name["strDrink"]
#     cocktails_name.gsub!(' ', '%20')
#     names.push(cocktails_name)
#   end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktail = JSON.parse(cocktail_array)
  # puts cocktails[1]
    # cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    # end
  # end
    #     end
    #   end
    end
end
  coctail_seed()
puts 'Seed cognac ends'



def cachaca_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=cachaca").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
  end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  cachaca_seed()
puts 'Seed cachaa ends'




def kahlua_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=kahlua").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
    names.push(cocktails_name)
  end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  kahlua_seed()
puts 'Seed kahlua ends'




def tequila_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=tequila").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
    end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  tequila_seed()
puts 'Seed tequila ends'



def curacao_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=curacao").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
    end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  curacao_seed()
puts 'Seed curacao ends'



def rum_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=rum").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
    end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  rum_seed()
puts 'Seed rum ends'



def light_rum_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=light%20rum").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
    end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
light_rum_seed()
puts 'Seed light rum ends'




def dark_rum_seed
  # cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=dark%20rum").read
  # cocktails_name = JSON.parse(cocktailsname_array)
# end
names = ['Abilene', 'Adam', 'Almeria', 'Bahama Mama', "Bleeding Surgeon", 'Blue Hurricane', 'Blueberry Mojito', 'Cuba Libra', 'Dark and Stormy', "Gideon%27s Green Dinosaur", 'Lord And Lady', 'Midnight Cowboy', 'Mojito Extra', 'Planter%27s Punch', 'Quentin', 'The Galah', 'Veteran']
# cocktails_name['drinks'].each do |name|
#     cocktails_name = name["strDrink"]
#     cocktails_name = name["strDrink"]
#     cocktails_name.gsub!(' ', '%20')
#     cocktails_name.gsub!("'", '%27')
#     cocktails_name.gsub!("é", 'e')
#     names.push(cocktails_name)
#     end
#   # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
dark_rum_seed()
puts 'Seed dark rum ends'


def beer_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=beer").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
    end

  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  beer_seed()
puts 'Seed beer ends'


def brandy_seed
  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=brandy").read
  cocktails_name = JSON.parse(cocktailsname_array)
# end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
    end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  brandy_seed()
puts 'Seed brandy ends'



def triplesec_seed

  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Triple%20Sec").read
  cocktails_name = JSON.parse(cocktailsname_array)
  # end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
      names.push(cocktails_name)
    end

  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
end
  triplesec_seed()
  puts 'Seed Triple%20Sec ends'
# alcools.each do |alcool|


def gin_seed
    cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=gin").read
    cocktails_name = JSON.parse(cocktailsname_array)
  # end
    names = []
    cocktails_name['drinks'].each do |name|
      cocktails_name = name["strDrink"]
      cocktails_name.gsub!(' ', '%20')
        names.push(cocktails_name)
    end
    # puts names
    names.each do |name|
    cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
    cocktails = JSON.parse(cocktail_array)
    # puts cocktails[1]
    cocktails['drinks'].each do |cocktail|

        cocktail_name = cocktail["strDrink"]
        # puts cocktail_name
        cocktail_instruction = cocktail["strInstructions"]
        cocktail_image = cocktail["strDrinkThumb"]
        cocktail_ingredient1 = cocktail["strIngredient1"]
        cocktail_ingredient2 = cocktail["strIngredient2"]
        cocktail_ingredient3 = cocktail["strIngredient3"]
        cocktail_ingredient4 = cocktail["strIngredient4"]
        cocktail_ingredient5 = cocktail["strIngredient5"]
        cocktail_ingredient6 = cocktail["strIngredient6"]
        cocktail_ingredient7 = cocktail["strIngredient7"]
        cocktail_ingredient8 = cocktail["strIngredient8"]
        cocktail_ingredient9 = cocktail["strIngredient9"]
        cocktail_ingredient10 = cocktail["strIngredient10"]
        cocktail_ingredient11 = cocktail["strIngredient11"]
        cocktail_ingredient12 = cocktail["strIngredient12"]
        cocktail_ingredient13 = cocktail["strIngredient13"]
        cocktail_ingredient14 = cocktail["strIngredient14"]
        cocktail_ingredient15 = cocktail["strIngredient15"]
        cocktail_measure1 = cocktail["strMeasure1"]
        cocktail_measure2 = cocktail["strMeasure2"]
        cocktail_measure3 = cocktail["strMeasure3"]
        cocktail_measure4 = cocktail["strMeasure4"]
        cocktail_measure5 = cocktail["strMeasure5"]
        cocktail_measure6 = cocktail["strMeasure6"]
        cocktail_measure7 = cocktail["strMeasure7"]
        cocktail_measure8 = cocktail["strMeasure8"]
        cocktail_measure9 = cocktail["strMeasure9"]
        cocktail_measure10 = cocktail["strMeasure10"]
        cocktail_measure11 = cocktail["strMeasure11"]
        cocktail_measure12 = cocktail["strMeasure12"]
        cocktail_measure13 = cocktail["strMeasure13"]
        cocktail_measure14 = cocktail["strMeasure14"]
        cocktail_measure15 = cocktail["strMeasure15"]

        Cocktail.create!(
          name: cocktail_name,
          instruction: cocktail_instruction,
          image: cocktail_image,
          ingredient1: cocktail_ingredient1,
          ingredient2: cocktail_ingredient2,
          ingredient3: cocktail_ingredient3,
          ingredient4: cocktail_ingredient4,
          ingredient5: cocktail_ingredient5,
          ingredient6: cocktail_ingredient6,
          ingredient7: cocktail_ingredient7,
          ingredient8: cocktail_ingredient8,
          ingredient9: cocktail_ingredient9,
          ingredient10: cocktail_ingredient10,
          ingredient11: cocktail_ingredient11,
          ingredient12: cocktail_ingredient12,
          ingredient13: cocktail_ingredient13,
          ingredient14: cocktail_ingredient14,
          ingredient15: cocktail_ingredient15,
          measure1: cocktail_measure1,
          measure2: cocktail_measure2,
          measure3: cocktail_measure3,
          measure4: cocktail_measure4,
          measure5: cocktail_measure5,
          measure6: cocktail_measure6,
          measure7: cocktail_measure7,
          measure8: cocktail_measure8,
          measure9: cocktail_measure9,
          measure10: cocktail_measure10,
          measure11: cocktail_measure11,
          measure12: cocktail_measure12,
          measure13: cocktail_measure13,
          measure14: cocktail_measure14,
          measure15: cocktail_measure15
        )
      end
    end
      #     end
      #   end
      # end
  end
    gin_seed()
puts 'Seed gin ends'


def campari_seed

cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=campari").read
cocktails_name = JSON.parse(cocktailsname_array)
# end
names = []
cocktails_name['drinks'].each do |name|
  cocktails_name = name["strDrink"]
  cocktails_name.gsub!(' ', '%20')
  names.push(cocktails_name)
end
# puts names
names.each do |name|
cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
cocktails = JSON.parse(cocktail_array)
# puts cocktails[1]
cocktails['drinks'].each do |cocktail|

    cocktail_name = cocktail["strDrink"]
    # puts cocktail_name
    cocktail_instruction = cocktail["strInstructions"]
    cocktail_image = cocktail["strDrinkThumb"]
    cocktail_ingredient1 = cocktail["strIngredient1"]
    cocktail_ingredient2 = cocktail["strIngredient2"]
    cocktail_ingredient3 = cocktail["strIngredient3"]
    cocktail_ingredient4 = cocktail["strIngredient4"]
    cocktail_ingredient5 = cocktail["strIngredient5"]
    cocktail_ingredient6 = cocktail["strIngredient6"]
    cocktail_ingredient7 = cocktail["strIngredient7"]
    cocktail_ingredient8 = cocktail["strIngredient8"]
    cocktail_ingredient9 = cocktail["strIngredient9"]
    cocktail_ingredient10 = cocktail["strIngredient10"]
    cocktail_ingredient11 = cocktail["strIngredient11"]
    cocktail_ingredient12 = cocktail["strIngredient12"]
    cocktail_ingredient13 = cocktail["strIngredient13"]
    cocktail_ingredient14 = cocktail["strIngredient14"]
    cocktail_ingredient15 = cocktail["strIngredient15"]
    cocktail_measure1 = cocktail["strMeasure1"]
    cocktail_measure2 = cocktail["strMeasure2"]
    cocktail_measure3 = cocktail["strMeasure3"]
    cocktail_measure4 = cocktail["strMeasure4"]
    cocktail_measure5 = cocktail["strMeasure5"]
    cocktail_measure6 = cocktail["strMeasure6"]
    cocktail_measure7 = cocktail["strMeasure7"]
    cocktail_measure8 = cocktail["strMeasure8"]
    cocktail_measure9 = cocktail["strMeasure9"]
    cocktail_measure10 = cocktail["strMeasure10"]
    cocktail_measure11 = cocktail["strMeasure11"]
    cocktail_measure12 = cocktail["strMeasure12"]
    cocktail_measure13 = cocktail["strMeasure13"]
    cocktail_measure14 = cocktail["strMeasure14"]
    cocktail_measure15 = cocktail["strMeasure15"]

    Cocktail.create!(
      name: cocktail_name,
      instruction: cocktail_instruction,
      image: cocktail_image,
      ingredient1: cocktail_ingredient1,
      ingredient2: cocktail_ingredient2,
      ingredient3: cocktail_ingredient3,
      ingredient4: cocktail_ingredient4,
      ingredient5: cocktail_ingredient5,
      ingredient6: cocktail_ingredient6,
      ingredient7: cocktail_ingredient7,
      ingredient8: cocktail_ingredient8,
      ingredient9: cocktail_ingredient9,
      ingredient10: cocktail_ingredient10,
      ingredient11: cocktail_ingredient11,
      ingredient12: cocktail_ingredient12,
      ingredient13: cocktail_ingredient13,
      ingredient14: cocktail_ingredient14,
      ingredient15: cocktail_ingredient15,
      measure1: cocktail_measure1,
      measure2: cocktail_measure2,
      measure3: cocktail_measure3,
      measure4: cocktail_measure4,
      measure5: cocktail_measure5,
      measure6: cocktail_measure6,
      measure7: cocktail_measure7,
      measure8: cocktail_measure8,
      measure9: cocktail_measure9,
      measure10: cocktail_measure10,
      measure11: cocktail_measure11,
      measure12: cocktail_measure12,
      measure13: cocktail_measure13,
      measure14: cocktail_measure14,
      measure15: cocktail_measure15
    )
  end
end
  #     end
  #   end
  # end
end
campari_seed()
puts 'Seed campari ends'


def vermouth_seed

  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=vermouth").read
  cocktails_name = JSON.parse(cocktailsname_array)
  # end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
    names.push(cocktails_name)
  end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
  end
  vermouth_seed()
  puts 'Seed vermouth ends'

def amaretto_seed

  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=amaretto").read
  cocktails_name = JSON.parse(cocktailsname_array)
  # end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
    names.push(cocktails_name)
  end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
  end
  amaretto_seed()
  puts 'Seed amaretto ends'


def whisky_seed

  cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=whisky").read
  cocktails_name = JSON.parse(cocktailsname_array)
  # end
  names = []
  cocktails_name['drinks'].each do |name|
    cocktails_name = name["strDrink"]
    cocktails_name.gsub!(' ', '%20')
    names.push(cocktails_name)
  end
  # puts names
  names.each do |name|
  cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
  cocktails = JSON.parse(cocktail_array)
  # puts cocktails[1]
  cocktails['drinks'].each do |cocktail|

      cocktail_name = cocktail["strDrink"]
      # puts cocktail_name
      cocktail_instruction = cocktail["strInstructions"]
      cocktail_image = cocktail["strDrinkThumb"]
      cocktail_ingredient1 = cocktail["strIngredient1"]
      cocktail_ingredient2 = cocktail["strIngredient2"]
      cocktail_ingredient3 = cocktail["strIngredient3"]
      cocktail_ingredient4 = cocktail["strIngredient4"]
      cocktail_ingredient5 = cocktail["strIngredient5"]
      cocktail_ingredient6 = cocktail["strIngredient6"]
      cocktail_ingredient7 = cocktail["strIngredient7"]
      cocktail_ingredient8 = cocktail["strIngredient8"]
      cocktail_ingredient9 = cocktail["strIngredient9"]
      cocktail_ingredient10 = cocktail["strIngredient10"]
      cocktail_ingredient11 = cocktail["strIngredient11"]
      cocktail_ingredient12 = cocktail["strIngredient12"]
      cocktail_ingredient13 = cocktail["strIngredient13"]
      cocktail_ingredient14 = cocktail["strIngredient14"]
      cocktail_ingredient15 = cocktail["strIngredient15"]
      cocktail_measure1 = cocktail["strMeasure1"]
      cocktail_measure2 = cocktail["strMeasure2"]
      cocktail_measure3 = cocktail["strMeasure3"]
      cocktail_measure4 = cocktail["strMeasure4"]
      cocktail_measure5 = cocktail["strMeasure5"]
      cocktail_measure6 = cocktail["strMeasure6"]
      cocktail_measure7 = cocktail["strMeasure7"]
      cocktail_measure8 = cocktail["strMeasure8"]
      cocktail_measure9 = cocktail["strMeasure9"]
      cocktail_measure10 = cocktail["strMeasure10"]
      cocktail_measure11 = cocktail["strMeasure11"]
      cocktail_measure12 = cocktail["strMeasure12"]
      cocktail_measure13 = cocktail["strMeasure13"]
      cocktail_measure14 = cocktail["strMeasure14"]
      cocktail_measure15 = cocktail["strMeasure15"]

      Cocktail.create!(
        name: cocktail_name,
        instruction: cocktail_instruction,
        image: cocktail_image,
        ingredient1: cocktail_ingredient1,
        ingredient2: cocktail_ingredient2,
        ingredient3: cocktail_ingredient3,
        ingredient4: cocktail_ingredient4,
        ingredient5: cocktail_ingredient5,
        ingredient6: cocktail_ingredient6,
        ingredient7: cocktail_ingredient7,
        ingredient8: cocktail_ingredient8,
        ingredient9: cocktail_ingredient9,
        ingredient10: cocktail_ingredient10,
        ingredient11: cocktail_ingredient11,
        ingredient12: cocktail_ingredient12,
        ingredient13: cocktail_ingredient13,
        ingredient14: cocktail_ingredient14,
        ingredient15: cocktail_ingredient15,
        measure1: cocktail_measure1,
        measure2: cocktail_measure2,
        measure3: cocktail_measure3,
        measure4: cocktail_measure4,
        measure5: cocktail_measure5,
        measure6: cocktail_measure6,
        measure7: cocktail_measure7,
        measure8: cocktail_measure8,
        measure9: cocktail_measure9,
        measure10: cocktail_measure10,
        measure11: cocktail_measure11,
        measure12: cocktail_measure12,
        measure13: cocktail_measure13,
        measure14: cocktail_measure14,
        measure15: cocktail_measure15
      )
    end
  end
    #     end
    #   end
    # end
  end
  whisky_seed()
  puts 'Seed whisky ends'


  def whiskey_seed

    cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=whiskey").read
    cocktails_name = JSON.parse(cocktailsname_array)
    # end
    names = []
    cocktails_name['drinks'].each do |name|
      cocktails_name = name["strDrink"]
      cocktails_name.gsub!(' ', '%20')
        names.push(cocktails_name)
    end
    # puts names
    names.each do |name|
    cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
    cocktails = JSON.parse(cocktail_array)
    # puts cocktails[1]
    cocktails['drinks'].each do |cocktail|

        cocktail_name = cocktail["strDrink"]
        # puts cocktail_name
        cocktail_instruction = cocktail["strInstructions"]
        cocktail_image = cocktail["strDrinkThumb"]
        cocktail_ingredient1 = cocktail["strIngredient1"]
        cocktail_ingredient2 = cocktail["strIngredient2"]
        cocktail_ingredient3 = cocktail["strIngredient3"]
        cocktail_ingredient4 = cocktail["strIngredient4"]
        cocktail_ingredient5 = cocktail["strIngredient5"]
        cocktail_ingredient6 = cocktail["strIngredient6"]
        cocktail_ingredient7 = cocktail["strIngredient7"]
        cocktail_ingredient8 = cocktail["strIngredient8"]
        cocktail_ingredient9 = cocktail["strIngredient9"]
        cocktail_ingredient10 = cocktail["strIngredient10"]
        cocktail_ingredient11 = cocktail["strIngredient11"]
        cocktail_ingredient12 = cocktail["strIngredient12"]
        cocktail_ingredient13 = cocktail["strIngredient13"]
        cocktail_ingredient14 = cocktail["strIngredient14"]
        cocktail_ingredient15 = cocktail["strIngredient15"]
        cocktail_measure1 = cocktail["strMeasure1"]
        cocktail_measure2 = cocktail["strMeasure2"]
        cocktail_measure3 = cocktail["strMeasure3"]
        cocktail_measure4 = cocktail["strMeasure4"]
        cocktail_measure5 = cocktail["strMeasure5"]
        cocktail_measure6 = cocktail["strMeasure6"]
        cocktail_measure7 = cocktail["strMeasure7"]
        cocktail_measure8 = cocktail["strMeasure8"]
        cocktail_measure9 = cocktail["strMeasure9"]
        cocktail_measure10 = cocktail["strMeasure10"]
        cocktail_measure11 = cocktail["strMeasure11"]
        cocktail_measure12 = cocktail["strMeasure12"]
        cocktail_measure13 = cocktail["strMeasure13"]
        cocktail_measure14 = cocktail["strMeasure14"]
        cocktail_measure15 = cocktail["strMeasure15"]

        Cocktail.create!(
          name: cocktail_name,
          instruction: cocktail_instruction,
          image: cocktail_image,
          ingredient1: cocktail_ingredient1,
          ingredient2: cocktail_ingredient2,
          ingredient3: cocktail_ingredient3,
          ingredient4: cocktail_ingredient4,
          ingredient5: cocktail_ingredient5,
          ingredient6: cocktail_ingredient6,
          ingredient7: cocktail_ingredient7,
          ingredient8: cocktail_ingredient8,
          ingredient9: cocktail_ingredient9,
          ingredient10: cocktail_ingredient10,
          ingredient11: cocktail_ingredient11,
          ingredient12: cocktail_ingredient12,
          ingredient13: cocktail_ingredient13,
          ingredient14: cocktail_ingredient14,
          ingredient15: cocktail_ingredient15,
          measure1: cocktail_measure1,
          measure2: cocktail_measure2,
          measure3: cocktail_measure3,
          measure4: cocktail_measure4,
          measure5: cocktail_measure5,
          measure6: cocktail_measure6,
          measure7: cocktail_measure7,
          measure8: cocktail_measure8,
          measure9: cocktail_measure9,
          measure10: cocktail_measure10,
          measure11: cocktail_measure11,
          measure12: cocktail_measure12,
          measure13: cocktail_measure13,
          measure14: cocktail_measure14,
          measure15: cocktail_measure15
        )
      end
    end
      #     end
      #   end
      # end
    end
    whiskey_seed()
    puts 'Seed whiskey ends'


  def apricot_brandy_seed

    cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Apricot%20Brandy").read
    cocktails_name = JSON.parse(cocktailsname_array)
    # end
    names = []
    cocktails_name['drinks'].each do |name|
      cocktails_name = name["strDrink"]
      cocktails_name.gsub!(' ', '%20')
        names.push(cocktails_name)
    end
    # puts names
    names.each do |name|
    cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
    cocktails = JSON.parse(cocktail_array)
    # puts cocktails[1]
    cocktails['drinks'].each do |cocktail|

        cocktail_name = cocktail["strDrink"]
        # puts cocktail_name
        cocktail_instruction = cocktail["strInstructions"]
        cocktail_image = cocktail["strDrinkThumb"]
        cocktail_ingredient1 = cocktail["strIngredient1"]
        cocktail_ingredient2 = cocktail["strIngredient2"]
        cocktail_ingredient3 = cocktail["strIngredient3"]
        cocktail_ingredient4 = cocktail["strIngredient4"]
        cocktail_ingredient5 = cocktail["strIngredient5"]
        cocktail_ingredient6 = cocktail["strIngredient6"]
        cocktail_ingredient7 = cocktail["strIngredient7"]
        cocktail_ingredient8 = cocktail["strIngredient8"]
        cocktail_ingredient9 = cocktail["strIngredient9"]
        cocktail_ingredient10 = cocktail["strIngredient10"]
        cocktail_ingredient11 = cocktail["strIngredient11"]
        cocktail_ingredient12 = cocktail["strIngredient12"]
        cocktail_ingredient13 = cocktail["strIngredient13"]
        cocktail_ingredient14 = cocktail["strIngredient14"]
        cocktail_ingredient15 = cocktail["strIngredient15"]
        cocktail_measure1 = cocktail["strMeasure1"]
        cocktail_measure2 = cocktail["strMeasure2"]
        cocktail_measure3 = cocktail["strMeasure3"]
        cocktail_measure4 = cocktail["strMeasure4"]
        cocktail_measure5 = cocktail["strMeasure5"]
        cocktail_measure6 = cocktail["strMeasure6"]
        cocktail_measure7 = cocktail["strMeasure7"]
        cocktail_measure8 = cocktail["strMeasure8"]
        cocktail_measure9 = cocktail["strMeasure9"]
        cocktail_measure10 = cocktail["strMeasure10"]
        cocktail_measure11 = cocktail["strMeasure11"]
        cocktail_measure12 = cocktail["strMeasure12"]
        cocktail_measure13 = cocktail["strMeasure13"]
        cocktail_measure14 = cocktail["strMeasure14"]
        cocktail_measure15 = cocktail["strMeasure15"]

        Cocktail.create!(
          name: cocktail_name,
          instruction: cocktail_instruction,
          image: cocktail_image,
          ingredient1: cocktail_ingredient1,
          ingredient2: cocktail_ingredient2,
          ingredient3: cocktail_ingredient3,
          ingredient4: cocktail_ingredient4,
          ingredient5: cocktail_ingredient5,
          ingredient6: cocktail_ingredient6,
          ingredient7: cocktail_ingredient7,
          ingredient8: cocktail_ingredient8,
          ingredient9: cocktail_ingredient9,
          ingredient10: cocktail_ingredient10,
          ingredient11: cocktail_ingredient11,
          ingredient12: cocktail_ingredient12,
          ingredient13: cocktail_ingredient13,
          ingredient14: cocktail_ingredient14,
          ingredient15: cocktail_ingredient15,
          measure1: cocktail_measure1,
          measure2: cocktail_measure2,
          measure3: cocktail_measure3,
          measure4: cocktail_measure4,
          measure5: cocktail_measure5,
          measure6: cocktail_measure6,
          measure7: cocktail_measure7,
          measure8: cocktail_measure8,
          measure9: cocktail_measure9,
          measure10: cocktail_measure10,
          measure11: cocktail_measure11,
          measure12: cocktail_measure12,
          measure13: cocktail_measure13,
          measure14: cocktail_measure14,
          measure15: cocktail_measure15
        )
      end
    end
      #     end
      #   end
      # end
    end
    apricot_brandy_seed()
    puts 'Seed apricot_brandy_seed ends'

  def blendedwhiskey_seed

    cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Blended%20Whiskey").read
    cocktails_name = JSON.parse(cocktailsname_array)
    # end
    names = []
    cocktails_name['drinks'].each do |name|
      cocktails_name = name["strDrink"]
      cocktails_name.gsub!(' ', '%20')
        names.push(cocktails_name)
    end
    # puts names
    names.each do |name|
    cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
    cocktails = JSON.parse(cocktail_array)
    # puts cocktails[1]
    cocktails['drinks'].each do |cocktail|

        cocktail_name = cocktail["strDrink"]
        # puts cocktail_name
        cocktail_instruction = cocktail["strInstructions"]
        cocktail_image = cocktail["strDrinkThumb"]
        cocktail_ingredient1 = cocktail["strIngredient1"]
        cocktail_ingredient2 = cocktail["strIngredient2"]
        cocktail_ingredient3 = cocktail["strIngredient3"]
        cocktail_ingredient4 = cocktail["strIngredient4"]
        cocktail_ingredient5 = cocktail["strIngredient5"]
        cocktail_ingredient6 = cocktail["strIngredient6"]
        cocktail_ingredient7 = cocktail["strIngredient7"]
        cocktail_ingredient8 = cocktail["strIngredient8"]
        cocktail_ingredient9 = cocktail["strIngredient9"]
        cocktail_ingredient10 = cocktail["strIngredient10"]
        cocktail_ingredient11 = cocktail["strIngredient11"]
        cocktail_ingredient12 = cocktail["strIngredient12"]
        cocktail_ingredient13 = cocktail["strIngredient13"]
        cocktail_ingredient14 = cocktail["strIngredient14"]
        cocktail_ingredient15 = cocktail["strIngredient15"]
        cocktail_measure1 = cocktail["strMeasure1"]
        cocktail_measure2 = cocktail["strMeasure2"]
        cocktail_measure3 = cocktail["strMeasure3"]
        cocktail_measure4 = cocktail["strMeasure4"]
        cocktail_measure5 = cocktail["strMeasure5"]
        cocktail_measure6 = cocktail["strMeasure6"]
        cocktail_measure7 = cocktail["strMeasure7"]
        cocktail_measure8 = cocktail["strMeasure8"]
        cocktail_measure9 = cocktail["strMeasure9"]
        cocktail_measure10 = cocktail["strMeasure10"]
        cocktail_measure11 = cocktail["strMeasure11"]
        cocktail_measure12 = cocktail["strMeasure12"]
        cocktail_measure13 = cocktail["strMeasure13"]
        cocktail_measure14 = cocktail["strMeasure14"]
        cocktail_measure15 = cocktail["strMeasure15"]

        Cocktail.create!(
          name: cocktail_name,
          instruction: cocktail_instruction,
          image: cocktail_image,
          ingredient1: cocktail_ingredient1,
          ingredient2: cocktail_ingredient2,
          ingredient3: cocktail_ingredient3,
          ingredient4: cocktail_ingredient4,
          ingredient5: cocktail_ingredient5,
          ingredient6: cocktail_ingredient6,
          ingredient7: cocktail_ingredient7,
          ingredient8: cocktail_ingredient8,
          ingredient9: cocktail_ingredient9,
          ingredient10: cocktail_ingredient10,
          ingredient11: cocktail_ingredient11,
          ingredient12: cocktail_ingredient12,
          ingredient13: cocktail_ingredient13,
          ingredient14: cocktail_ingredient14,
          ingredient15: cocktail_ingredient15,
          measure1: cocktail_measure1,
          measure2: cocktail_measure2,
          measure3: cocktail_measure3,
          measure4: cocktail_measure4,
          measure5: cocktail_measure5,
          measure6: cocktail_measure6,
          measure7: cocktail_measure7,
          measure8: cocktail_measure8,
          measure9: cocktail_measure9,
          measure10: cocktail_measure10,
          measure11: cocktail_measure11,
          measure12: cocktail_measure12,
          measure13: cocktail_measure13,
          measure14: cocktail_measure14,
          measure15: cocktail_measure15
        )
      end
    end
      #     end
      #   end
      # end
    end
    blendedwhiskey_seed()
    puts 'Seed blendedwhiskey_seed ends'



    def bourbon_seed

      cocktailsname_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=bourbon").read
      cocktails_name = JSON.parse(cocktailsname_array)
      # end
      names = []
      cocktails_name['drinks'].each do |name|
        cocktails_name = name["strDrink"]
        cocktails_name.gsub!(' ', '%20')
          names.push(cocktails_name)
      end
      # puts names
      names.each do |name|
      cocktail_array = URI.open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name}").read
      cocktails = JSON.parse(cocktail_array)
      # puts cocktails[1]
      cocktails['drinks'].each do |cocktail|

          cocktail_name = cocktail["strDrink"]
          # puts cocktail_name
          cocktail_instruction = cocktail["strInstructions"]
          cocktail_image = cocktail["strDrinkThumb"]
          cocktail_ingredient1 = cocktail["strIngredient1"]
          cocktail_ingredient2 = cocktail["strIngredient2"]
          cocktail_ingredient3 = cocktail["strIngredient3"]
          cocktail_ingredient4 = cocktail["strIngredient4"]
          cocktail_ingredient5 = cocktail["strIngredient5"]
          cocktail_ingredient6 = cocktail["strIngredient6"]
          cocktail_ingredient7 = cocktail["strIngredient7"]
          cocktail_ingredient8 = cocktail["strIngredient8"]
          cocktail_ingredient9 = cocktail["strIngredient9"]
          cocktail_ingredient10 = cocktail["strIngredient10"]
          cocktail_ingredient11 = cocktail["strIngredient11"]
          cocktail_ingredient12 = cocktail["strIngredient12"]
          cocktail_ingredient13 = cocktail["strIngredient13"]
          cocktail_ingredient14 = cocktail["strIngredient14"]
          cocktail_ingredient15 = cocktail["strIngredient15"]
          cocktail_measure1 = cocktail["strMeasure1"]
          cocktail_measure2 = cocktail["strMeasure2"]
          cocktail_measure3 = cocktail["strMeasure3"]
          cocktail_measure4 = cocktail["strMeasure4"]
          cocktail_measure5 = cocktail["strMeasure5"]
          cocktail_measure6 = cocktail["strMeasure6"]
          cocktail_measure7 = cocktail["strMeasure7"]
          cocktail_measure8 = cocktail["strMeasure8"]
          cocktail_measure9 = cocktail["strMeasure9"]
          cocktail_measure10 = cocktail["strMeasure10"]
          cocktail_measure11 = cocktail["strMeasure11"]
          cocktail_measure12 = cocktail["strMeasure12"]
          cocktail_measure13 = cocktail["strMeasure13"]
          cocktail_measure14 = cocktail["strMeasure14"]
          cocktail_measure15 = cocktail["strMeasure15"]

          Cocktail.create!(
            name: cocktail_name,
            instruction: cocktail_instruction,
            image: cocktail_image,
            ingredient1: cocktail_ingredient1,
            ingredient2: cocktail_ingredient2,
            ingredient3: cocktail_ingredient3,
            ingredient4: cocktail_ingredient4,
            ingredient5: cocktail_ingredient5,
            ingredient6: cocktail_ingredient6,
            ingredient7: cocktail_ingredient7,
            ingredient8: cocktail_ingredient8,
            ingredient9: cocktail_ingredient9,
            ingredient10: cocktail_ingredient10,
            ingredient11: cocktail_ingredient11,
            ingredient12: cocktail_ingredient12,
            ingredient13: cocktail_ingredient13,
            ingredient14: cocktail_ingredient14,
            ingredient15: cocktail_ingredient15,
            measure1: cocktail_measure1,
            measure2: cocktail_measure2,
            measure3: cocktail_measure3,
            measure4: cocktail_measure4,
            measure5: cocktail_measure5,
            measure6: cocktail_measure6,
            measure7: cocktail_measure7,
            measure8: cocktail_measure8,
            measure9: cocktail_measure9,
            measure10: cocktail_measure10,
            measure11: cocktail_measure11,
            measure12: cocktail_measure12,
            measure13: cocktail_measure13,
            measure14: cocktail_measure14,
            measure15: cocktail_measure15
          )
        end
      end
        #     end
        #   end
        # end
      end
      bourbon_seed()
      puts 'Seed bourbon_seed ends'
