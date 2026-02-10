puts "Nettoyage..."
Cocktail.destroy_all
Alcool.destroy_all

puts "Création des alcools..."
vodka = Alcool.create!(name: "Vodka", alt: "vodka")
rhum = Alcool.create!(name: "Rhum", alt: "rhum")

puts "Création des cocktails liés..."
Cocktail.create!(
  name: "Moscow Mule",
  instruction: "Mélanger vodka et ginger beer.",
  image: "https://www.thecocktaildb.com/images/media/drink/3pylqc1504370288.jpg",
  alcool: vodka
)

Cocktail.create!(
  name: "Mojito",
  instruction: "Rhum, menthe, citron vert.",
  image: "https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg",
  alcool: rhum
)

puts "Terminé !"
