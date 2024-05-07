animal_product(lomito).
animal_product(pollo).
animal_product(pescado).
animal_product(atún).
animal_product(leche).
animal_product(mantequilla).
animal_product(queso).
animal_product(huevo).
animal_product(miel).

special_dish_main(lomito).
special_dish_main(pollo).
special_dish_main(pescado).
special_dish_main(atún).
special_dish_main(hongos).

special_dish_side(potatoes).
special_dish_side(rice).
special_dish_side(mushrooms).
special_dish_side(zuccini).

# TODO: change this to direct users with names
# diet(vegan).
# diet(vegetarian).
# diet(gluten_free).
# diet(lactose_free).
# diet(carnivore).
# EXAMPLE:
omnivor(chiqui).
mushroom_allergic(Israel).
vegetarian(Carlos).
vegan(Angie).
lactose_free(Emilia).
pasta_free(Luis).

contains(basic_pasta, pasta).
contains(basic_pasta, orégano).
contains(basic_pasta, tomate).
contains(basic_pasta, aceite).
contains(basic_pasta, sal).

contains(hongos_al_horno, hongos).
contains(hongos_al_horno, queso).
contains(hongos_al_horno, mantequilla).
contains(hongos_al_horno, sal).

contains(caesar_salad, lechuga).
contains(caesar_salad, tomate).
contains(caesar_salad, sal).
contains(caesar_salad, vinagre).

contains(ice_cream, leche).
contains(ice_cream, miel).
contains(ice_cream, fresas).

can_eat_meal(person_diete, common_meal) :-
    omnivor(person_diete);
    (lactose_free(person_diete), not(contains(common_meal, leche)));

can_eat_meal(person_diete, meal_main_dish, meal_side_dish) :-


can_eat_ice_cream(person_diete) :-

# what function to add?
# can_eat_meal(Person, Meal) :- can_eat_meal(Person, Meal, []).
# can_eat_meal(Person, Meal, Restrictions) :- can_eat_meal(Person, Meal, Restrictions, []). ?