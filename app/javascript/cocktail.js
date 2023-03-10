console.info('js/cocktails.js loaded');

document.addEventListener("prechange"), function(event) {
  document.querySelector('ons-toolbar .center')
  .innerHTML = event.tabItem.getAttribute('label');
};

function getRandomCocktail(){
  fetch('https://www.thecocktaildb.com/api/json/v1/1/random.php')
 .then(
   function(response) {
     if (response.status == 200) {
       console.log('Looks like there was a problem. Status Code: ' +
       response.status);
       return;
     }
     // Examine the text in the response
     response.json().then(function(data) {
     //console.log(data);
     displayRandomCocktail(data);
   });
 }
)
 .catch(function(err) {
 console.log('Fetch Error :-S', err);
 });
}

getRandomCocktail();

function displayRandomCocktail(cocktail){
console.log(cocktail.drinks[0]);

let drinkSection = document.querySelector('#drink-section');

let drinkName = document.createElement('h2');
drinkName.innerHTML = cocktail.drink[0].strDrink;

drinkSection.appendChild(drinkName);

let img = document.createElement('img')
img.src = cocktail.drinks[0].strDrinkThumb;

drinkSection.appendChild(img)

for(let i=1; i<16; i++)

if(cocktail.drinks[0][`strIngredient${i}`] == null ||cocktail.drinks[0][`strIngredient${i}`] == '' ) {
 break;
}
 let ingredient = document.createElement('ons-list-item');
 ingredient.innerHTML = cocktail.drinks[0][`strMeasure${i}`] + ':' + cocktail.drinks[0][`strIngredient${i}`]

 drinkSection.appendChild(ingredient);

 let card = document.createElement('ons-card')
 card.innerHTML = cocktail.drinks[0].strInstructions;

 drinkSection.appendChild(card);
}
