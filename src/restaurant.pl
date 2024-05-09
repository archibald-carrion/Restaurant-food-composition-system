animal_product_meat(lomito).
animal_product_meat(pollo).
animal_product_meat(pescado).
animal_product_meat(atún).

animal_product_not_meat(leche).
animal_product_not_meat(mantequilla).
animal_product_not_meat(queso).
animal_product_not_meat(huevo).
animal_product_not_meat(miel).

not_animal_product(mushrooms).
not_animal_product(arroz).
not_animal_product(frijoles).
not_animal_product(pasta).
not_animal_product(tomate).
not_animal_product(lechuga).
not_animal_product(chile).
not_animal_product(maíz).
not_animal_product(zucchini).
not_animal_product(hongos).
not_animal_product(cebolla).
not_animal_product(sal).
not_animal_product(repollo).
not_animal_product(orégano).
not_animal_product(apio).
not_animal_product(remolacha).
not_animal_product(papa).
not_animal_product(aceite).
not_animal_product(tofu).
not_animal_product(leche_de_almendra).
not_animal_product(café).
not_animal_product(chocolate).
not_animal_product(agua).
not_animal_product(vinagre).
not_animal_product(fresas).

/* definition of common meals and if they are viable for specific diet*/
is_vegan_meal(basic_pasta).
is_vegan_meal(caesar_salad).
is_vegetarian_meal(X):- is_vegan_meal(X).
is_vegetarian_meal(mushrooms_al_horno).
is_vegetarian_meal(ice_cream).

/* definition of special meals main dishes and if they are viable for specific diet*/
is_vegan_main_dish(mushroom).
is_vegetarian_main_dish(X):- is_vegan_main_dish(X).

/* definition of special meals side dishes and if they are viable for specific diet*/
is_vegan_side_dish(mushroom).
is_vegan_side_dish(potatoes).
is_vegan_side_dish(zuccini).
is_vegan_side_dish(rice).
is_vegetarian_side_dish(X):- is_vegan_side_dish(X).

/*
special_dish_main(lomito).
special_dish_main(pollo).
special_dish_main(pescado).
special_dish_main(atún).
special_dish_main(mushrooms).

special_dish_side(potatoes).
special_dish_side(rice).
special_dish_side(mushrooms).
special_dish_side(zuccini).
*/

/* USER DEFINITION */
is_omnivor(chiqui).
is_mushroom_allergic(israel).
is_vegetarian(carlos).
is_vegetarian(vegetarian).
is_vegan(angie).
eats_lactose_free(emilia).
eats_pasta_free(luis).

/* check if a given diet or user with given diet can eat common meal*/
can_eat_meal(D, M) :-
    is_omnivor(D);
    (is_vegetarian(D), is_vegetarian_meal(M));
    (is_vegan(D), is_vegan_meal(M)).

/* check if a given diet or user with given diet can eat special meal*/
can_eat_special_meal(D, MD, SD) :-
    is_omnivor(D);
    (is_vegetarian(D), is_vegetarian_main_dish(MD), is_vegetarian_side_dish(SD));
    (is_vegan(D), is_vegan_main_dish(MD), is_vegan_side_dish(SD)).