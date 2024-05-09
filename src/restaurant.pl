animal_product_meat(lomito).
animal_product_meat(pollo).
animal_product_meat(pescado).
animal_product_meat(atún).

animal_product_not_meat(leche).
animal_product_not_meat(mantequilla).
animal_product_not_meat(queso).
animal_product_not_meat(huevo).
animal_product_not_meat(miel).

not_animal_product(hongos).
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
is_vegetarian_meal(hongos_al_horno).
is_vegetarian_meal(ice_cream).
is_lactose_free_meal(basic_pasta).
is_lactose_free_meal(caesar_salad).

/* definition of special meals main dishes and if they are viable for specific diet*/
is_vegan_main_dish(hongos).
is_vegetarian_main_dish(X):- is_vegan_main_dish(X).
is_lactose_free_main_dish(pollo).
is_lactose_free_main_dish(lomito).
is_lactose_free_main_dish(pescado).
is_lactose_free_main_dish(atún).
is_lactose_free_main_dish(hongos).
/* definition of special meals side dishes and if they are viable for specific diet*/
is_vegan_side_dish(hongos).
is_vegan_side_dish(potatoes).
is_vegan_side_dish(zuccini).
is_vegan_side_dish(rice).
is_vegetarian_side_dish(X):- is_vegan_side_dish(X).
is_lactose_free_side_dish(hongos).
is_lactose_free_side_dish(potatoes).
is_lactose_free_side_dish(zuccini).
is_lactose_free_side_dish(rice).

/*Basic Pasta*/
has_ingredient(basic_pasta, pasta).
has_ingredient(basic_pasta, orégano).
has_ingredient(basic_pasta, tomate).
has_ingredient(basic_pasta, aceite).
has_ingredient(basic_pasta, sal).

/*Caesar Salad*/
has_ingredient(caesar_salad, lechuga).
has_ingredient(caesar_salad, tomate).
has_ingredient(caesar_salad, vinagre).
has_ingredient(caesar_salad, sal).

/*Hongos al horno*/
has_ingredient(hongos_al_horno, hongos).
has_ingredient(hongos_al_horno, queso).
has_ingredient(hongos_al_horno, mantequilla).
has_ingredient(hongos_al_horno, sal).

/*Ice cream*/
has_ingredient(ice_cream, miel).
has_ingredient(ice_cream, leche).
has_ingredient(ice_cream, fresas).

/*Main Dishes*/
has_ingredient(pollo,pollo).
has_ingredient(lomito,lomito).
has_ingredient(pescado,pescado).
has_ingredient(atún,atún).
has_ingredient(hongos,hongos).

/*Side Dishes*/
has_ingredient(potatoes,potatoes).
has_ingredient(hongos,hongos).
has_ingredient(zuccini,zuccini).
has_ingredient(arroz,arroz).


/*
special_dish_main(lomito).
special_dish_main(pollo).
special_dish_main(pescado).
special_dish_main(atún).
special_dish_main(hongos).

special_dish_side(potatoes).
special_dish_side(rice).
special_dish_side(hongos).
special_dish_side(zuccini).
*/

/* USER DEFINITION */
is_omnivor(omnivor).
is_omnivor(chiqui).

is_vegetarian(vegetarian).
is_vegetarian(carlos).
is_vegetarian(vegetarian).

is_vegan(vegan).
is_vegan(angie).

eats_lactose_free(lactose_intolerant).
eats_lactose_free(emilia).

eats_pasta_free(pasta_free).
eats_pasta_free(luis).

is_allergic(israel,hongos).


/* check if a given diet or user with given diet can eat common meal*/
can_eat_meal(D, M) :-
    is_omnivor(D);
    (is_vegetarian(D), is_vegetarian_meal(M));
    (is_vegan(D), is_vegan_meal(M));
    (eats_lactose_free(D), is_lactose_free_meal(M)).

/* check if a given diet or user with given diet can eat special meal*/
can_eat_special_meal(D, MD, SD) :-
    is_omnivor(D);
    (is_vegetarian(D), is_vegetarian_main_dish(MD), is_vegetarian_side_dish(SD));
    (is_vegan(D), is_vegan_main_dish(MD), is_vegan_side_dish(SD), not_animal_product(MD), not_animal_product(SD));
    (eats_lactose_free(D), is_lactose_free_main_dish(MD), is_lactose_free_side_dish(SD)).

dish_has_ingredient(D, I) :-
    has_ingredient(D,I).

special_dish_has_ingredient(MD, SD, I) :-
    (has_ingredient(MD,I);has_ingredient(SD,I)).

can_eat_meal_diet_ingredients(D, M, I) :-
 	(dish_has_ingredient(M, I),can_eat_meal(D, M)).

can_eat_special_meal_diet_ingredients(D, MD, SD, I) :-
    (special_dish_has_ingredient(MD, SD, I),can_eat_special_meal(D, MD, SD)).
