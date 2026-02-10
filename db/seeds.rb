puts "Nettoyage..."
Cocktail.destroy_all
Alcool.destroy_all

puts "Création des alcools..."
gin = Alcool.create!(name: "Gin", alt: "gin")
vodka = Alcool.create!(name: "Vodka", alt: "vodka")
rhum = Alcool.create!(name: "Rhum", alt: "rum")

puts "Création des cocktails (Données stables)..."
# On en crée quelques uns à la main pour être SUR que ça marche
Cocktail.create!(name: "Mojito", instruction: "Menthe, sucre, rhum, citron vert.", image: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg", alcool: rhum)
Cocktail.create!(name: "Moscow Mule", instruction: "Vodka, bière de gingembre, citron.", image: "https://www.thecocktaildb.com/images/media/drink/3pylqc1504370288.jpg", alcool: vodka)
Cocktail.create!(name: "Gin Tonic", instruction: "Gin, tonic, citron vert.", image: "https://www.thecocktaildb.com/images/media/drink/z0omgo1582467175.jpg", alcool: gin)

puts "Tentative d'ajout via API (sécurisée)..."
begin
  data = JSON.parse(URI.open("https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=gin").read)
  if data['drinks']
    data['drinks'].take(5).each do |c|
      # On ne crée que si l'API répond vraiment
      Cocktail.create(name: c["strDrink"], image: c["strDrinkThumb"], alcool: gin)
    end
  end
rescue => e
  puts "L'API est indisponible, mais le site ne crash pas ! Erreur: #{e.message}"
end

puts "Seed terminé avec succès !"
