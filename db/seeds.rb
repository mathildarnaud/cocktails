require "json"
require "open-uri"

puts "1. Nettoyage..."
Cocktail.destroy_all
Alcool.destroy_all

puts "2. Création de la liste des 20 alcools..."
alcools_to_import = [
  { name: "Gin", alt: "gin" },
  { name: "Vodka", alt: "vodka" },
  { name: "Rhum", alt: "rum" },
  { name: "Tequila", alt: "tequila" },
  { name: "Whisky", alt: "whiskey" },
  { name: "Bourbon", alt: "bourbon" },
  { name: "Scotch", alt: "scotch" },
  { name: "Cognac", alt: "cognac" },
  { name: "Cachaça", alt: "cachaca" },
  { name: "Triple Sec", alt: "triple_sec" },
  { name: "Campari", alt: "campari" },
  { name: "Vermouth", alt: "vermouth" },
  { name: "Amaretto", alt: "amaretto" },
  { name: "Sake", alt: "sake" },
  { name: "Absinthe", alt: "absinthe" },
  { name: "Brandy", alt: "brandy" },
  { name: "Kahlua", alt: "kahlua" },
  { name: "Malibu", alt: "malibu" },
  { name: "Pisco", alt: "pisco" },
  { name: "Champagne", alt: "champagne" }
]

alcools_crees = {}
alcools_to_import.each do |data|
  alcools_crees[data[:alt]] = Alcool.create!(name: data[:name], alt: data[:alt])
end

puts "--- #{Alcool.count} alcools créés ---"

puts "3. Importation des cocktails..."

alcools_crees.each do |alt_name, alcool_objet|
  puts "Importation pour : #{alcool_objet.name}..."
  # Pause de 0.5s pour éviter d'être bloqué par l'API
  sleep(0.5) 

  begin
    list_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{alt_name}"
    list_res = JSON.parse(URI.open(list_url).read)

    if list_res && list_res['drinks']
      # On en prend jusqu'à 20 par alcool pour avoir du volume
      list_res['drinks'].take(20).each do |item|
        
        encoded_name = URI.encode_www_form_component(item["strDrink"])
        detail_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{encoded_name}"
        detail_data = JSON.parse(URI.open(detail_url).read)

        if detail_data && detail_data['drinks']
          c = detail_data['drinks'].first
          Cocktail.create!(
            name: c["strDrink"],
            instruction: c["strInstructions"],
            image: c["strDrinkThumb"],
            alcool: alcool_objet,
            ingredient1: c["strIngredient1"],
            ingredient2: c["strIngredient2"],
            measure1: c["strMeasure1"],
            measure2: c["strMeasure2"]
          )
        end
      end
    end
  rescue => e
    puts "Erreur pour #{alcool_objet.name} : #{e.message}"
  end
end

puts "--- SEED TERMINÉ : #{Cocktail.count} cocktails créés ! ---"
