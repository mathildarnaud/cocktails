require "json"
require "open-uri"

puts "1. Nettoyage de la base..."
Cocktail.destroy_all
Alcool.destroy_all

puts "2. Création des alcools..."
# On crée une liste d'alcools avec le nom attendu par l'API (alt)
alcools_data = [
  { name: "Gin", alt: "gin" },
  { name: "Vodka", alt: "vodka" },
  { name: "Rhum", alt: "rum" },
  { name: "Tequila", alt: "tequila" },
  { name: "Scotch", alt: "scotch" },
  { name: "Cognac", alt: "cognac" }
]

# On crée les alcools et on les stocke dans un dictionnaire pour les lier après
alcools_crees = {}
alcools_data.each do |data|
  alcools_crees[data[:alt]] = Alcool.create!(name: data[:name], alt: data[:alt])
end

puts "3. Récupération des cocktails via l'API..."

alcools_crees.each do |ingredient_name, alcool_objet|
  puts "Recherche pour : #{ingredient_name}..."
  
  begin
    # Étape A : Lister les cocktails pour cet ingrédient
    list_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{ingredient_name}"
    list_res = JSON.parse(URI.open(list_url).read)

    # LA SÉCURITÉ : On vérifie si 'drinks' existe pour éviter l'erreur nil:NilClass
    if list_res && list_res['drinks']
      # On en prend 10 maximum par alcool pour ne pas surcharger l'API
      list_res['drinks'].take(10).each do |item|
        
        # Étape B : Chercher les détails de CE cocktail précis
        # On encode le nom pour gérer les espaces et caractères spéciaux
        encoded_name = URI.encode_www_form_component(item["strDrink"])
        detail_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{encoded_name}"
        detail_res = JSON.parse(URI.open(detail_url).read)

        if detail_res && detail_res['drinks']
          data = detail_res['drinks'].first
          
          # Étape C : Création du cocktail AVEC la liaison
          Cocktail.create!(
            name: data["strDrink"],
            instruction: data["strInstructions"],
            image: data["strDrinkThumb"],
            alcool: alcool_objet, # C'est ici qu'on fait le lien !
            ingredient1: data["strIngredient1"],
            ingredient2: data["strIngredient2"],
            ingredient3: data["strIngredient3"],
            measure1: data["strMeasure1"],
            measure2: data["strMeasure2"]
          )
        end
      end
    end
  rescue => e
    puts "Erreur réseau pour #{ingredient_name} : #{e.message}"
    next # On passe à l'alcool suivant au lieu de tout faire planter
  end
end

puts "Terminé ! #{Cocktail.count} cocktails créés."
