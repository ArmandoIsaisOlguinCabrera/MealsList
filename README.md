
# YAPE Prueba Tecnica
## Video

[![Video de YouTube](https://img.youtube.com/vi/djbKB9uOP-s/0.jpg)](https://youtu.be/djbKB9uOP-s)

Esta app es nativa escrita de Swift utilizando solo frameworks de apple como MapKit, UIKit y Foundation,
consta de 3 pantallas anidadas en un Navigation Controller.

Se uso la arquitectura MVVM, ya que a mi parecer esta un poco sobrada la arquitectura VIPER para hacer 3 pantallas, seria abstraer demasiado el problema.

Para la parte visual se generaron las vistas sencillas de modo programatico usando UIKit, se utilizo un modulo en particular para las peticiones API cuyo dominio https://www.themealdb.com/api.php en particular use un metodo que permite devolver una lista de platillos sin embargo el metodo gratuito que mas se ajustaba a lo que necesitaba es este: de tipo get 

List all meals by first letter
www.themealdb.com/api/json/v1/1/search.php?f=a

El parametro f=a devuelve la lista de meals cuyo nombre empieza con "a" correspondiente a 4 comidas, decidi tomar la siguiente letra "b" ya que regresa un numero considerable de recetas por lo que me decidi por usar dicho parametro:
www.themealdb.com/api/json/v1/1/search.php?f=b

Este servicio nos va a devolver un JSON parecido a esto:



```bash
  {
  "meals": [
    {
      "idMeal": "52767",
      "strMeal": "Bakewell tart",
      "strDrinkAlternate": null,
      "strCategory": "Dessert",
      "strArea": "British",
      "strInstructions": "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
      "strTags": "Tart,Baking,Alcoholic",
      "strYoutube": "https://www.youtube.com/watch?v=1ahpSTf_Pvk",
      "strIngredient1": "plain flour",
              .
              . 
              .
      "strIngredient20": null,
      "strMeasure1": "175g/6oz",
              . 
              .
              .
              .
      "strSource": null,
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    },
    {
      "idMeal": "52792",
      "strMeal": "Bread and Butter Pudding",
      "strDrinkAlternate": null,
      "strCategory": "Dessert",
      "strArea": "British",
      "strInstructions": "Grease a 1 litre/2 pint pie dish with butter.\r\nCut the crusts off the bread. Spread each slice with on one side with butter, then cut into triangles.\r\nArrange a layer of bread, buttered-side up, in the bottom of the dish, then add a layer of sultanas. Sprinkle with a little cinnamon, then repeat the layers of bread and sultanas, sprinkling with cinnamon, until you have used up all of the bread. Finish with a layer of bread, then set aside.\r\nGently warm the milk and cream in a pan over a low heat to scalding point. Don't let it boil.\r\nCrack the eggs into a bowl, add three quarters of the sugar and lightly whisk until pale.\r\nAdd the warm milk and cream mixture and stir well, then strain the custard into a bowl.\r\nPour the custard over the prepared bread layers and sprinkle with nutmeg and the remaining sugar and leave to stand for 30 minutes.\r\nPreheat the oven to 180C/355F/Gas 4.\r\nPlace the dish into the oven and bake for 30-40 minutes, or until the custard has set and the top is golden-brown.",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg",
      "strTags": "Pudding,Brunch",
      "strYoutube": "https://www.youtube.com/watch?v=Vz5W1-BmOE4",
      "strIngredient1": "butter",
              .
              . 
              .
      "strIngredient20": "",
      "strMeasure1": "25g/1oz",
              .
              . 
              .
      "strMeasure20": "",
      "strSource": "https://cooking.nytimes.com/recipes/1018529-coq-au-vin",
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    },
    {
      "idMeal": "52803",
      "strMeal": "Beef Wellington",
      "strDrinkAlternate": null,
      "strCategory": "Beef",
      "strArea": "British",
      "strInstructions": "Put the mushrooms into a food processor with some seasoning and pulse to a rough paste. Scrape the paste into a pan and cook over a high heat for about 10 mins, tossing frequently, to cook out the moisture from the mushrooms. Spread out on a plate to cool.\r\nHeat in a frying pan and add a little olive oil. Season the beef and sear in the hot pan for 30 secs only on each side. (You don't want to cook it at this stage, just colour it). Remove the beef from the pan and leave to cool, then brush all over with the mustard.\r\nLay a sheet of cling film on a work surface and arrange the Parma ham slices on it, in slightly overlapping rows. With a palette knife, spread the mushroom paste over the ham, then place the seared beef fillet in the middle. Keeping a tight hold of the cling film from the edge, neatly roll the Parma ham and mushrooms around the beef to form a tight barrel shape. Twist the ends of the cling film to secure. Chill for 15-20 mins to allow the beef to set and keep its shape.\r\nRoll out the puff pastry on a floured surface to a large rectangle, the thickness of a £1 coin. Remove the cling film from the beef, then lay in the centre. Brush the surrounding pastry with egg yolk. Fold the ends over, the wrap the pastry around the beef, cutting off any excess. Turn over, so the seam is underneath, and place on a baking sheet. Brush over all the pastry with egg and chill for about 15 mins to let the pastry rest.\r\nHeat the oven to 200C, 400F, gas 6.\r\nLightly score the pastry at 1cm intervals and glaze again with beaten egg yolk. Bake for 20 minutes, then lower the oven setting to 180C, 350F, gas 4 and cook for another 15 mins. Allow to rest for 10-15 mins before slicing and serving with the side dishes of your choice. The beef should still be pink in the centre when you serve it.",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/vvpprx1487325699.jpg",
      "strTags": "Meat,Stew",
      "strYoutube": "https://www.youtube.com/watch?v=FS8u1RBdf6I",
      "strIngredient1": "mushrooms",
              .
              . 
              .
      "strIngredient20": null,
      "strMeasure1": "400g",
              .
              . 
              .
      "strMeasure20": "",
      "strSource": "http://www.goodtoknow.co.uk/recipes/164868/Gordon-Ramsay-s-beef-Wellington",
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    },
              .
              . 
              .
    {
      "idMeal": "52995",
      "strMeal": "BBQ Pork Sloppy Joes",
      "strDrinkAlternate": null,
      "strCategory": "Pork",
      "strArea": "American",
      "strInstructions": "1\r\n\r\nPreheat oven to 450 degrees. Wash and dry all produce. Cut sweet potatoes into ½-inch-thick wedges. Toss on a baking sheet with a drizzle of oil, salt, and pepper. Roast until browned and tender, 20-25 minutes.\r\n\r\n2\r\n\r\nMeanwhile, halve and peel onion. Slice as thinly as possible until you have ¼ cup (½ cup for 4 servings); finely chop remaining onion. Peel and finely chop garlic. Halve lime; squeeze juice into a small bowl. Halve buns. Add 1 TBSP butter (2 TBSP for 4) to a separate small microwave-safe bowl; microwave until melted, 30 seconds. Brush onto cut sides of buns.\r\n\r\n3\r\n\r\nTo bowl with lime juice, add sliced onion, ¼ tsp sugar (½ tsp for 4 servings), and a pinch of salt. Stir to combine; set aside to quick-pickle.\r\n\r\n4\r\n\r\nHeat a drizzle of oil in a large pan over medium-high heat. Add chopped onion and season with salt and pepper. Cook, stirring, until softened, 4-5 minutes. Add garlic and cook until fragrant, 30 seconds more. Add pork and season with salt and pepper. Cook, breaking up meat into pieces, until browned and cooked through, 4-6 minutes.\r\n\r\n5\r\n\r\nWhile pork cooks, in a third small bowl, combine BBQ sauce, pickling liquid from onion, 3 TBSP ketchup (6 TBSP for 4 servings), ½ tsp sugar (1 tsp for 4), and ¼ cup water (⅓ cup for 4). Once pork is cooked through, add BBQ sauce mixture to pan. Cook, stirring, until sauce is thickened, 2-3 minutes. Taste and season with salt and pepper.\r\n\r\n6\r\n\r\nMeanwhile, toast buns in oven or toaster oven until golden, 3-5 minutes. Divide toasted buns between plates and fill with as much BBQ pork as you’d like. Top with pickled onion and hot sauce. Serve with sweet potato wedges on the side.",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/atd5sh1583188467.jpg",
      "strTags": null,
      "strYoutube": "",
      "strIngredient1": "Potatoes",
              .
              . 
              .
      "strIngredient20": "",
      "strMeasure1": "2",
              .
              . 
              .
      "strMeasure20": " ",
      "strSource": "",
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    }
  ]
}
```


Como podemos observar, nos viene un arreglo de tipo "meals" y cada elemento contiene propiedades, Me gustaria hacer enfasis en algunas caracteristicas:

    1.- En lugar de venir un arreglo de ingredientes y medidas o un diccionario con ingrediente : medida, vienen 20 strings para ingredientes y 20 srings para medidas, pudiendo ser nulos en caso de no completarlos. Para esto se utilizo la caracteristica de los valores opcionales en Swift.
    2.- No viene como tal, un pais si no mas bien el area del platillo, por lo que si quisieramos convirtir el "strArea": "American" a una ubicacion en MapKit, deberiamos convertir el area a el pais por ejemplo en este caso "American" deberia resultar en "United States", ya con esto podriamos convertir este pais a una objeto del tipo Geocode con la funcion geocodeAddressString de MapKit.
    3.- La imagen viene como un string, por lo que hay que convertir el string a una URL, posteriormente el URL en una umagen y asignarlo al UIImageView




## Implementaciones
- UIKit
- MapKit
- Arquitectura MVVM 

## Views
- MealCell.swift: Vista programatica de nuestras celdas, con un UIImageView y un UILabel

## API
- HTTP.swift: Enum con el case de GET (si un dia decidimos consumir otro servicio de tipo POST, UPDATE, etc. solo bastaria con añadirlo a nuestro enum)
- EndPoint.swift: Compondra nuestro request, podriamos añadir elementos al httpBody, o cambiar el httpMethod anterior. Podriamos añadir mas queryItems o cambiarlos, aqui tenemos el query item que nos indica el valor b para consumir los platillos que comienzan con la letra "b"
- MealsService.swift: Contiene la peticion y la logica para mediante urlsession 
manejar el resultado de la peticion ya sea exitosa o erronea.

## Models
- Meal.swift: Aqui ajustamos los valores que nos interesa salvar de la peticion, en mi caso solo necesito 4
    
    - strMeal, strMealThumb, strInstructions, strArea

## ViewsModels
- HomeControllerViewModel.swift: Contiene en el inicializador la llamada al servicio de obtener los platillos, dos funciones para saber si se esta utilizando el searchController que permitira actualizar la tabla y la logica para saber si el resultado de la peticion fue exitoso o no
- MealDetailsControllerViewModel.swift: Contiene en el inicializador la funcion para cargar la imagen desde la url y ademas asigna el valor traido del platillo seleccionado anteriormente para poder mostrar datos en la vista de detalle, aqui es donde se muestran algunos datos mas como por ejemplo las instrucciones y el boton que nos dirigira mas tarde a la vista de mapa, tiene algunas variables para tratar de mejor manera la informacion recibida por ejemplo ya se convierte el strArea a un pais. Ademas se retorna un string para poder concatenar un poco mas entendible los labels en lugar de "Beavertails" -> "Platillo: Beavertails".
- MapControllerViewModel.swift: En este view model solo tenemos en el inicializador que recibe el objeto de tipo Meal para poder extraer el area que anteriormente recibimos del servicio

## Controllers
- HomeController.swift: En esta clase se construye la vista con UIKit de la pantalla principal consta de un tableview, un search controller que filtra por dos valores NOMBRE e INGREDIENTES, las funciones para asignar el alto de la celda, asignar las celdas de tipo "MealCell" al tableview, algunos constraints asi como otras funciones. 
- MealDetailsController.swift: En esta clase se construyen la vista de detalles, se asigna un scrollview que contendra la imagen de la comida ,despues se añade un stackView vertical que contendra el boton para ir a la pantalla de mapas, la etiqueta con el nombre del platillo y por ultimo la descripcion de como preparar el platillo.
- MapController.swift: Contiene la creacion de el mapView, el placeMark que es el pin que se posicionara donde indique nuestro valor de area, modificado por la funcion area to country para asi asignarle un pais y otras funciones por ejemplo, aqui tambien se utiliza set region, para centrar la vista del mapa en la pantalla conforme al pin marcado.

## Clases Supporting
- Constants.swift: Contiene algunos strings en duro, por ejemplo la base de la URL del servicio ("www.themealdb.com")

- AreaToContryConverter.swift: Contiene un diccionario que contiene todas las areas y devuelve el pais para asi obtener el valor para buscar en mapkit

## ReceiptsAppTests
- HomeControllerViewModelTests.swift: Contienen funciones para probar si se obtuvieron valores de platillos para la lista, si la variable para saber si el usuario esta ocupando el filtro esta en true o en false, cuando deberia filtrarse el table view deberia retornar ese valor especifico.

- MapControllerViewModelTests.swift: Contiene las pruebas creadas por default en xcode ya que aca no tengo funciones para el MapControllerViewModel.swift

- MealDetailsControllerViewModelTests.swift: Contiene pruebas para valuar que los valores de retorno sean correctos por ejepmlo en lugar de "enchiladas verdes" nos regrese "Platillo: Enchiladas verdes", asi para cada valor ademas de que prueba la funcion para obtener la imagen dada la url y no exceda un timeout



## GIF
![GIF de ejemplo](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbTdjcnZyM2s5bnM2a3dtMG8yb2R3NjhleGwyZHRzcmtweGF4Y3RrbiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/7v2Eq0dg7un8do4O91/giphy.gif)
