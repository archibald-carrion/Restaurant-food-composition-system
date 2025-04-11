# The Restaurant - A Prolog/XPCE Project
[![Prolog](https://img.shields.io/badge/Prolog-brightgreen?style=flat-square&logo=prolog&logoColor=white)](https://www.swi-prolog.org/)
[![XPCE](https://img.shields.io/badge/XPCE-48a832)](https://www.swi-prolog.org/)

## Description

Program written in prolog that allows waiters to answer specific questions based on knowledge of the menu, ingredients, and customer characteristics.

## How to run the program

---

## 🧰 Option 1: Native Setup on Windows

### ✅ 1. Install SWI-Prolog

Download from:  
👉 https://www.swi-prolog.org/Download.html

Choose the 64-bit Windows installer. It comes with:
- `swipl` command-line interface
- XPCE GUI library

### ✅ 2. Test if XPCE works using the Button example

Save this as `button_test.pl`:

```prolog
:- use_module(library(pce)).

run :-
    new(Window, dialog('Simple GUI')),
    send(Window, append(button('Click Me', message(@prolog, hello)))),
    send(Window, open).

hello :-
    writeln('Button was clicked!').
```

Run it:

```sh
swipl-win button_test.pl
?- run.
```

Note: Depending on your installation swipl may work, but in my case it didn't so I had to run `swipl-win` instead.

### ✅ 3. Run the program



---

## 🧰 Option 2: Docker


---

### We are able to query:

- [x] If a client with specific characteristics can consume a specific dish
- [x] Can Chiqui eat Mushroom Pasta Special?
- [x] If a dish has a particular ingredient when queried by a user
- [x] Does Mushroom Special with Mushrooms have Mushrooms?
- [x] Recommend dish options that are suitable for a client
- [x] What can Carlos eat?
- [x] Recommend dishes that contain a desired ingredient
- [x] What do you have with strawberries?
- [x] Recommend a dish for a specific type of dietary requirement. For example, for vegetarians.
- [x] What is there for a vegan with rice?
- [x] Prevent a dish that a particular client cannot consume from being approved
- [x] Can Angie eat meat special with rice?
- [x] In the known database, define a type of client with particular characteristics to know what they can eat. Add Fidel who is a Cannibal that eats Cat meat.

### The program is based on the following knowledge base:

**Common knowledge about the clientel**

- a vegetarian is a person who does **NOT** eat meat
- a vegan is a person who does **NOT** eat any animal products
- an allergic person is a person who does **NOT** eat a specific ingredient
- one can be alergic to any ingredient
- in the given context a cannibal is a cat who eats cat meat

**List of all the components available in the restaurant**

- lomito (animal product, meat)
- pollo (animal product, meat)
- pescado (animal product)
- atún (animal product)
- leche (animal product)
- mantequilla (animal product)
- queso (animal product)
- huevo (animal product)
- miel (animal product)
- arroz
- frijoles
- pasta (sin huevo)
- tomate
- lechuga
- chile
- maíz
- zucchini
- hongos
- cebolla
- sal
- repollo
- orégano
- apio
- remolacha
- papa
- aceite
- tofu
- leche_de_almendra
- café
- chocolate
- agua
- vinagre
- fresas

_Note: is atun and pescado considered meat?_

**Common dishes & ingredients**

- Basic pasta (pasta, orégano, tomate, aceite, sal)
- Hongos al horno (hongos, queso, mantequilla, sal)
- Ensala Caesar (lechuga, tomate, sal, vinagre)

**Special dishes, main ingredients**

_(Note: Special dishes must contains one of the following ingredients)_

- pollo (animal product, meat)
- lomito (animal product, meat)
- pescado (animal product)
- atún (animal product)
- hongos

_(All of those special dishes is cooked using cebolla, sal y vinagre)_

**Special dishes, side dishes**

_(Note: Special dishes must contains one of the following ingredients)_

- with potatoes
- with mushrooms
- with zuccini
- with rice

**Ice cream contains**

- miel
- leche
- fresas

**Usual costumers**

- Israel es alérgica a los hongos
- Carlos es vegetariano
- Angie es vegana
- Chiqui come de todo
- Luis no come pasta
- Emilia es intolerante a los lácteos

**User Manual**

1. for simple meals you have to run the function can_eat_meal(Diet, Meals) where Diet is person who has the special diet and Meals is the list of meals you want to check.
   For example:

```prolog
can_eat_meal(angie, Meals).
```

this will return all the meals Angie can eat.

2. for special meals you have to run the function can_eat_meal(Diet, MainDish, SideDish) where Diet is person who has the special diet, MainDish is the main dish and SideDish is the side dish. For example:

```prolog
can_eat_meal(carlos, MainDish, SideDish).
```

this will return all the meals Carlos can eat.

## Authors

Archibald Emmanuel Carrión Claeys C01736
Fabián Vega Meza C08369
Marlon Esteban Murillo Quesada C15427
