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

# what function to add?
# can_eat_meal(Person, Meal) :- can_eat_meal(Person, Meal, []).
# can_eat_meal(Person, Meal, Restrictions) :- can_eat_meal(Person, Meal, Restrictions, []). ?