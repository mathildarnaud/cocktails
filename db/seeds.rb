require "json"
require "open-uri"

puts "1. Nettoyage de la base de données..."
Cocktail.destroy_all
Alcool.destroy_all

puts "2. Création des 17 alcools sélectionnés..."
# Cette liste assure une grande variété de cocktails
alcools_to_import = [
  { name: "Gin", alt: "gin" },
  { name: "Vodka", alt: "vodka" },
  { name: "Rhum Blanc", alt: "light_rum" },
  { name: "Rhum Ambré", alt: "dark_rum" },
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
  { name: "Brandy", alt: "brandy" }
]

alcools_crees = {}
alcools_to_import.each do |data|
  alcools_crees[data[:alt]] = Alcool.create!(name: data[:name], alt: data[:alt])
end

puts "--- #{Alcool.count} alcools créés ---"

puts "3. Importation des cocktails (Liaison API sécurisée)..."

alcools_crees.each do |alt_name, alcool_objet|
  puts "Importation pour : #{alcool_objet.name}..."

  begin
    # On utilise l'URL de filtre par ingrédient
    list_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{alt_name}"
    list_res = JSON.parse(URI.open(list_url).read)

    if list_res && list_res['drinks']
      # On limite à 10 cocktails par alcool pour la performance sur Render
      list_res['drinks'].take(10).each do |item|
        
        # On va chercher les détails de chaque cocktail (ingrédients, instructions)
        encoded_name = URI.encode_www_form_component(item["strDrink"])
        detail_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{encoded_name}"
        detail_res = JSON.parse(URI.open(detail_url).read)

        if detail_res && detail_res['drinks']
          c = detail_res['drinks'].first
          
          Cocktail.create!(
            name: c["strDrink"],
            instruction: c["strInstructions"],
            image: c["strDrinkThumb"],
            alcool: alcool_objet, # Liaison cruciale !
            ingredient1: c["strIngredient1"],
            ingredient2: c["strIngredient2"],
            ingredient3: c["strIngredient3"],
            measure1: c["strMeasure1"],
            measure2: c["strMeasure2"],
            measure3: c["strMeasure3"]
          )
        end
      end
    end
  rescue => e
    puts "Erreur pour #{alcool_objet.name} : #{e.message}. On continue..."
  end
end

puts "--- SEED TERMINÉ : #{Cocktail.count} cocktails créés ! ---"
