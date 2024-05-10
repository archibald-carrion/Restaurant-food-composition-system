animal_product_meat(lomito).
animal_product_meat(pollo).
animal_product_meat(pescado).
animal_product_meat(atún).


vegan_friendly(hongos).
vegan_friendly(arroz).
vegan_friendly(frijoles).
vegan_friendly(pasta).
vegan_friendly(tomate).
vegan_friendly(lechuga).
vegan_friendly(chile).
vegan_friendly(maíz).
vegan_friendly(zucchini).
vegan_friendly(cebolla).
vegan_friendly(sal).
vegan_friendly(repollo).
vegan_friendly(orégano).
vegan_friendly(apio).
vegan_friendly(remolacha).
vegan_friendly(papa).
vegan_friendly(aceite).
vegan_friendly(tofu).
vegan_friendly(leche_de_almendra).
vegan_friendly(café).
vegan_friendly(chocolate).
vegan_friendly(agua).
vegan_friendly(vinagre).
vegan_friendly(fresas).

vegetarian_friendly(hongos).
vegetarian_friendly(arroz).
vegetarian_friendly(frijoles).
vegetarian_friendly(pasta).
vegetarian_friendly(tomate).
vegetarian_friendly(lechuga).
vegetarian_friendly(chile).
vegetarian_friendly(maíz).
vegetarian_friendly(zucchini).
vegetarian_friendly(cebolla).
vegetarian_friendly(sal).
vegetarian_friendly(repollo).
vegetarian_friendly(orégano).
vegetarian_friendly(apio).
vegetarian_friendly(remolacha).
vegetarian_friendly(papa).
vegetarian_friendly(aceite).
vegetarian_friendly(tofu).
vegetarian_friendly(leche_de_almendra).
vegetarian_friendly(café).
vegetarian_friendly(chocolate).
vegetarian_friendly(agua).
vegetarian_friendly(vinagre).
vegetarian_friendly(fresas).
vegetarian_friendly(leche).
vegetarian_friendly(mantequilla).
vegetarian_friendly(queso).
vegetarian_friendly(huevo).
vegetarian_friendly(miel).
/*
lactose_friendly(lomito).
lactose_friendly(pollo).
lactose_friendly(pescado).
lactose_friendly(atún).
lactose_friendly(miel).
lactose_friendly(huevo).
*/

/* definition of common meals and if they are viable for specific diet*/
/*
is_vegan_meal(basic_pasta).
is_vegan_meal(caesar_salad).
is_vegetarian_meal(X):- is_vegan_meal(X).
is_vegetarian_meal(hongos_al_horno).
is_vegetarian_meal(ice_cream).
is_lactose_free_meal(basic_pasta).
is_lactose_free_meal(caesar_salad).
*/

/* definition of special meals main dishes and if they are viable for specific diet*/
/*
is_vegan_main_dish(hongos).
is_vegetarian_main_dish(X):- is_vegan_main_dish(X).
is_lactose_free_main_dish(pollo).
is_lactose_free_main_dish(lomito).
is_lactose_free_main_dish(pescado).
is_lactose_free_main_dish(atún).
is_lactose_free_main_dish(hongos).
*/
/* definition of special meals side dishes and if they are viable for specific diet*/
/*
is_vegan_side_dish(hongos).
is_vegan_side_dish(potatoes).
is_vegan_side_dish(zuccini).
is_vegan_side_dish(arroz).
is_vegetarian_side_dish(X):- is_vegan_side_dish(X).
is_lactose_free_side_dish(hongos).
is_lactose_free_side_dish(potatoes).
is_lactose_free_side_dish(zuccini).
is_lactose_free_side_dish(arroz).
*/

/*Basic Pasta*/
/*
has_ingredient(basic_pasta, pasta).
has_ingredient(basic_pasta, orégano).
has_ingredient(basic_pasta, tomate).
has_ingredient(basic_pasta, aceite).
has_ingredient(basic_pasta, sal). */

/*Caesar Salad*/
/*
has_ingredient(caesar_salad, lechuga).
has_ingredient(caesar_salad, tomate).
has_ingredient(caesar_salad, vinagre).
has_ingredient(caesar_salad, sal). */

/*Hongos al horno*/
/*
has_ingredient(hongos_al_horno, hongos).
has_ingredient(hongos_al_horno, queso).
has_ingredient(hongos_al_horno, mantequilla).
has_ingredient(hongos_al_horno, sal). */

/*Ice cream*/
/*
has_ingredient(ice_cream, miel).
has_ingredient(ice_cream, leche).
has_ingredient(ice_cream, fresas). */

/*Main Dishes*/
is_main_dish(pollo).
is_main_dish(lomito).
is_main_dish(pescado).
is_main_dish(atún).
is_main_dish(hongos).

/*Side Dishes*/
is_side_dish(potatoes).
is_side_dish(hongos).
is_side_dish(zuccini).
is_side_dish(arroz).


/*
special_dish_main(lomito).
special_dish_main(pollo).
special_dish_main(pescado).
special_dish_main(atún).
special_dish_main(hongos).

special_dish_side(potatoes).
special_dish_side(arroz).
special_dish_side(hongos).
special_dish_side(zuccini).
*/

/* USER DEFINITION */
is_omnivor(omnivor).
is_omnivor(chiqui).

is_vegetarian(vegetarian).
is_vegetarian(carlos).

is_vegan(vegan).
is_vegan(angie).

is_lactose_intolerant(lactose_intolerant).
is_lactose_intolerant(emilia).

is_pasta_intolerant(pasta_intolerant).
is_pasta_intolerant(luis).

is_allergic(israel, hongos).

/* Define meals with their specific components */
common_meal(basic_pasta, [pasta, orégano, tomate, aceite, sal]).
common_meal(caesar_salad, [lechuga, tomate, vinagre, sal]).
common_meal(hongos_al_horno, [hongos, queso, mantequilla, sal]).
common_meal(ice_cream, [miel, leche, fresas]).

/* Check if all components of a meal are vegan-friendly */
are_all_components_vegan_friendly([]).
are_all_components_vegan_friendly([Component|Rest]) :-
    vegan_friendly(Component),
    are_all_components_vegan_friendly(Rest).

are_all_components_vegetarian_friendly([]).
are_all_components_vegetarian_friendly([Component|Rest]) :-
    vegetarian_friendly(Component),
    are_all_components_vegetarian_friendly(Rest).

/* Check if a given diet or user with given diet can eat common meal*/
can_eat_meal(D, M) :-
    is_omnivor(D);
    (is_vegetarian(D), common_meal(M, Components), are_all_components_vegetarian_friendly(Components));
    (is_vegan(D), common_meal(M, Components), are_all_components_vegan_friendly(Components)).









/* check if a given diet or user with given diet can eat special meal*/
can_eat_special_meal(D, MD, SD) :-
    is_omnivor(D);
    (is_vegetarian(D), is_vegetarian_main_dish(MD), is_vegetarian_side_dish(SD));
    (is_vegan(D), is_vegan_main_dish(MD), is_vegan_side_dish(SD)).
    /*(is_lactose_intolerant(D), is_lactose_free_main_dish(MD), is_lactose_free_side_dish(SD)).*/

dish_has_ingredient(D, I) :-
    has_ingredient(D,I).

special_dish_has_ingredient(MD, SD, I) :-
    (is_main_dish(MD), MD = I;is_side_dish(SD), SD = I).

can_eat_meal_diet_ingredients(D, M, I) :-
 	(dish_has_ingredient(M, I),can_eat_meal(D, M)).

can_eat_special_meal_diet_ingredients(D, MD, SD, I) :-
    (special_dish_has_ingredient(MD, SD, I),can_eat_special_meal(D, MD, SD)).

/*
can_alergic_eat(ELEMENT_ALERGIC_TO, M) :-
    is_allergic(D, I), dish_has_ingredient(M, I).
    */