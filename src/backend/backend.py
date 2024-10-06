from flask import Flask, jsonify, request
from pyswip import Prolog

app = Flask(__name__) # Flask app instance
prolog = Prolog() # Prolog engine instance
prolog.consult("src\backend\restaurant.pl") # load the knowledge base and rules from the prolog file


# based on the request, the server will check if the user can eat the meal and return the result
@app.route('api/check-meal', methods=['POST'])
def check_meal():
    data = request.json
    diet = data['diet'] # vegan_friendly, etc.
    main_dish = data['main_dish']
    side_dish = data['side_dish']
    # query the prolog engine
    query = f"can_eat_meal({diet}, {main_dish}, {side_dish})" # use same structure as found in the prolog file can_eat_meal(Diet, MainDish, SideDish)
    result = list(prolog.query(query))

    can_eat = len(result) > 0 # if the result is not empty, then the user can eat the meal

    return jsonify({'can_eat': can_eat})

# get the list of common meals
@app.route('api/common-meals', methods=['GET'])
def get_common_meals():
    query = prolog.query("common_meal(Name, Components)") # query the prolog engine for the common meals which are basic_pasta, caesar_salad, etc.
    meals = list(query)

    return jsonify([{
        'name': meal['Name'],
        'components': meal['Components']
    } for meal in meals])


if __name__ == '__main__':
    app.run(debug=True) # run the Flask app in debug mode