# The Restaurant
## Description
Program written in prolog that allows waiters to answer specific questions based on knowledge of the menu, ingredients, and customer characteristics.

### We are able to query:

- [ ] If a client with specific characteristics can consume a specific dish
- [x] Can Chiqui eat Mushroom Pasta Special?
- [x] If a dish has a particular ingredient when queried by a user
- [x] Does Mushroom Special with Mushrooms have Mushrooms?
- [x] Recommend dish options that are suitable for a client
- [x] What can Carlos eat?
- [x] Recommend dishes that contain a desired ingredient
- [x] What do you have with strawberries?
- [x] Recommend a dish for a specific type of dietary requirement. For example, for vegetarians.
- [x] What is there for a vegan with rice?
- [ ] Prevent a dish that a particular client cannot consume from being approved
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

*Note: is atun and pescado considered meat?*

**Common dishes & ingredients**
- Basic pasta (pasta, orégano, tomate, aceite, sal)
- Hongos al horno (hongos, queso, mantequilla, sal)
- Ensala Caesar (lechuga, tomate, sal, vinagre)

**Special dishes, main ingredients**

*(Note: Special dishes must contains one of the following ingredients)*
- pollo (animal product, meat)
- lomito (animal product, meat)
- pescado (animal product)
- atún (animal product)
- hongos

*(All of those special dishes is cooked using cebolla, sal y vinagre)*

**Special dishes, side dishes** 

*(Note: Special dishes must contains one of the following ingredients)*
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

## How to run
To run the project, 

## Code dependencies
The project uses the following libraries:

## Current implementation and future improvements
The project is still in development, and there are a few improvements that can be made. Here is a list of the current features and futures improvements:
- [ ] user friendly GUI