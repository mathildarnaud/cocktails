require "json"
require "open-uri"

puts "Nettoyage de la base de données..."
Cocktail.destroy_all
Alcool.destroy_all

puts "Création des alcools..."
# On stocke les alcools dans un hash pour les retrouver facilement
dynamic_alcools = {}
alcools_to_create = [
  {name: "Gin", alt: 'Gin'},
  {name: "Campari", alt: 'Campari'},
  {name: "Rhum", alt: 'Rum'},
  {name: "Tequila", alt: 'Tequila'},
  {name: "Vodka", alt: 'Vodka'},
  {name: "Whisky", alt: 'Whiskey'},
  {name: "Scotch", alt: 'Scotch'},
  {name: "Cognac", alt: 'Cognac'},
  {name: "Cachaca", alt: 'Cachaca'}
]

alcools_to_create.each do |data|
  dynamic_alcools[data[:name]] = Alcool.create!(name: data[:name], alt: data[:alt])
end

puts "--- #{Alcool.count} alcools créés ---"

# Méthode générique pour importer des cocktails et les lier à un alcool
def import_cocktails_for(alcool_obj)
  query_name = alcool_obj.alt || alcool_obj.name
  puts "Importation des cocktails pour : #{alcool_obj.name}..."
  
  begin
    # 1. On récupère la liste des cocktails pour cet ingrédient
    list_url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{query_name.downcase}"
    list_data = JSON.parse(URI.open(list_url).read)

    if list_data['drinks']
      # On limite à 10 cocktails par alcool pour ne pas surcharger le seed
      list_data['drinks'].take(10).each do |item|
        # 2. Pour chaque cocktail, on récupère les détails (instructions, etc.)
        name_encoded = URI.encode_www_form_component(item["strDrink"])
        detail_url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{name_encoded}"
        detail_data = JSON.parse(URI.open(detail_url).read)

        if detail_data['drinks']
          c = detail_data['drinks'].first
          Cocktail.create!(
            name: c["strDrink"],
            instruction: c["strInstructions"],
            image: c["strDrinkThumb"],
            # LIAISON : on associe le cocktail à l'objet alcool passé en paramètre
            alcool: alcool_obj, 
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
    puts "Erreur sur l'alcool #{alcool_obj.name} : #{e.message}"
  end
end

# Lancement de l'import pour chaque alcool créé
dynamic_alcools.each do |_name, alcool_obj|
  import_cocktails_for(alcool_obj)
end

puts "--- SEED TERMINÉ : #{Cocktail.count} cocktails créés ---"
