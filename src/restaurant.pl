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

lactose_friendly(lomito).
lactose_friendly(pollo).
lactose_friendly(pescado).
lactose_friendly(atún).
lactose_friendly(miel).
lactose_friendly(huevo).
lactose_friendly(X) :- vegan_friendly(X).

pasta_friendly(lomito).
pasta_friendly(pollo).
pasta_friendly(pescado).
pasta_friendly(atún).
pasta_friendly(huevo).
pasta_friendly(miel).
pasta_friendly(hongos).
pasta_friendly(arroz).
pasta_friendly(frijoles).
pasta_friendly(tomate).
pasta_friendly(lechuga).
pasta_friendly(chile).
pasta_friendly(maíz).
pasta_friendly(zucchini).
pasta_friendly(cebolla).
pasta_friendly(sal).
pasta_friendly(repollo).
pasta_friendly(orégano).
pasta_friendly(apio).
pasta_friendly(remolacha).
pasta_friendly(papa).
pasta_friendly(aceite).
pasta_friendly(tofu).
pasta_friendly(leche_de_almendra).
pasta_friendly(café).
pasta_friendly(chocolate).
pasta_friendly(agua).
pasta_friendly(vinagre).
pasta_friendly(fresas).
pasta_friendly(leche).
pasta_friendly(mantequilla).
pasta_friendly(queso).

special_dish_main(lomito, [lomito, cebolla, sal, vinagre]).
special_dish_main(pollo, [pollo, cebolla, sal, vinagre]).
special_dish_main(pescado, [pescado, cebolla, sal, vinagre]).
special_dish_main(atún, [atún, cebolla, sal, vinagre]).
special_dish_main(hongos, [hongos, cebolla, sal, vinagre]).

special_dish_side(papa).
special_dish_side(arroz).
special_dish_side(hongos).
special_dish_side(zucchini).

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
cat_cannibal(fidel).

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

/* Check if all components of a meal are vegetarian-friendly */
are_all_components_vegetarian_friendly([]).
are_all_components_vegetarian_friendly([Component|Rest]) :-
    vegetarian_friendly(Component),
    are_all_components_vegetarian_friendly(Rest).

/* Check if all components of a meal are lactose-friendly */
are_all_components_lactose_friendly([]).
are_all_components_lactose_friendly([Component|Rest]) :-
    lactose_friendly(Component),
    are_all_components_lactose_friendly(Rest).

/* Check if all components of a meal are pasta-friendly */
are_all_components_pasta_friendly([]).
are_all_components_pasta_friendly([Component|Rest]) :-
    pasta_friendly(Component),
    are_all_components_pasta_friendly(Rest).

/* Check if a given diet or user with given diet can eat common meal*/
can_eat_meal(Diet, Meals) :-
    is_omnivor(Diet);
    (is_vegetarian(Diet), common_meal(Meals, Components), are_all_components_vegetarian_friendly(Components));
    (is_vegan(Diet), common_meal(Meals, Components), are_all_components_vegan_friendly(Components));
    (is_lactose_intolerant(Diet), common_meal(Meals, Components), are_all_components_lactose_friendly(Components));
    (is_pasta_intolerant(Diet), common_meal(Meals, Components), are_all_components_pasta_friendly(Components));
    (cat_cannibal(Diet), false).

/* Define predicate to check if a meal contains an ingredient, used in recommendation_that_contains */
meal_contains_ingredient(Meal, Ingredient) :-
    common_meal(Meal, Ingredients),
    member(Ingredient, Ingredients).

/* Define predicate to check what the main dish of a special meal contains */
special_dish_contains_main(MainDish, Main) :-
    special_dish_main(MainDish, Mains),
    member(Main, Mains).

/* Define predicate to check what the side dish of a special meal contains */
special_dish_contains_side(SideDish, Side) :-
    special_dish_side(SideDish),
    Side = SideDish.

/* Predicate to find all meals that contain a given ingredient */
recommendation_that_contains(Ingredient, Meals) :-
    findall(Meal, meal_contains_ingredient(Meal, Ingredient), CommonMeals),
    findall(Meal, special_dish_contains_main(Meal, Ingredient), SpecialMealMain),
    findall(Meal, special_dish_contains_side(Meal, Ingredient), SpecialMealSide),
    append(CommonMeals, SpecialMealMain, TempMeals),
    append(TempMeals, SpecialMealSide, Meals).

/* List/check what special meal composed of main dish and side dish can a client with given diet can eat or not */
can_eat_meal(Diet, MainDish, SideDish) :-
    (is_omnivor(Diet));
    (is_vegetarian(Diet),
        special_dish_main(MainDish, Main), are_all_components_vegetarian_friendly(Main),
        special_dish_contains_side(SideDish, Side), vegetarian_friendly(Side));
    (is_vegan(Diet),
        special_dish_main(MainDish, Main), are_all_components_vegan_friendly(Main),
        special_dish_contains_side(SideDish, Side), vegan_friendly(Side));
    (is_lactose_intolerant(Diet),
        special_dish_main(MainDish, Main), are_all_components_lactose_friendly(Main),
        special_dish_contains_side(SideDish, Side), lactose_friendly(Side));
    (is_pasta_intolerant(Diet),
        special_dish_main(MainDish, Main), are_all_components_pasta_friendly(Main),
        special_dish_contains_side(SideDish, Side), pasta_friendly(Side));
    (cat_cannibal(Diet), false).


/* 
meal_contains_component(Meal, Component) :-
    common_meal(Meal, Components),
    member(Component, Components).


special_dish_contains_maindish(MainDish, Component) :-
    special_dish_main(MainDish),
    member(Component, MainDish).

does_special_dish_contains(MainDish, SideDish, Component) :-
    special_dish_contains_main(MainDish, Component);
    special_dish_contains_side(SideDish, Component).
    */