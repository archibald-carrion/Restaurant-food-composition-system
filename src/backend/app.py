from flask import Flask, jsonify, request
from flask_cors import CORS
from dataclasses import dataclass
from typing import List, Set, Dict, Optional
import re

app = Flask(__name__)
CORS(app)

@dataclass
class Rule:
    predicate: str
    args: List[str]

class PrologInterpreter:
    def __init__(self):
        self.facts: Dict[str, Set[tuple]] = {}
        self.rules: Dict[str, List[Rule]] = {}
    
    def parse_line(self, line: str) -> Optional[Rule]:
        # Remove comments
        line = re.sub(r'/\*.*?\*/', '', line)
        line = line.split('%')[0].strip()
        
        if not line or line.startswith('%'):
            return None
        
        # Parse fact or rule
        match = re.match(r'(\w+)\((.*?)\)\.?', line)
        if match:
            predicate, args_str = match.groups()
            args = [arg.strip() for arg in args_str.split(',')]
            return Rule(predicate, args)
        return None
    
    def load_from_file(self, filename: str):
        with open(filename, 'r', encoding='utf-8') as file:
            for line in file:
                rule = self.parse_line(line)
                if rule:
                    if rule.predicate not in self.facts:
                        self.facts[rule.predicate] = set()
                    self.facts[rule.predicate].add(tuple(rule.args))
    
    def query(self, predicate: str, args: List[str]) -> bool:
        if predicate not in self.facts:
            return False
        return tuple(args) in self.facts[predicate]

# Initialize the interpreter
interpreter = PrologInterpreter()

# Load your Prolog file
try:
    interpreter.load_from_file('your_prolog_file.pl')  # Replace with your actual file path
    print("Successfully loaded Prolog rules")
except Exception as e:
    print(f"Error loading Prolog file: {e}")

@app.route('/api/check-meal', methods=['POST'])
def check_meal():
    try:
        data = request.json
        diet = data.get('diet', '')
        main_dish = data.get('mainDish', '')
        side_dish = data.get('sideDish', '')
        
        # Check if the meal combination is valid
        can_eat = interpreter.query("can_eat_meal", [diet, main_dish, side_dish])
        
        return jsonify({
            "canEat": can_eat,
            "diet": diet,
            "mainDish": main_dish,
            "sideDish": side_dish
        })
    except Exception as e:
        return jsonify({
            "error": str(e)
        }), 500

@app.route('/api/menu', methods=['GET'])
def get_menu():
    try:
        # Get all unique main dishes and side dishes from the facts
        main_dishes = set()
        for args in interpreter.facts.get('animal_product_meat', set()):
            main_dishes.add(args[0])
        for args in interpreter.facts.get('vegetarian_friendly', set()):
            main_dishes.add(args[0])
        
        side_dishes = set()
        for args in interpreter.facts.get('vegetarian_friendly', set()):
            side_dishes.add(args[0])
        
        return jsonify({
            "main_dishes": list(main_dishes),
            "side_dishes": list(side_dishes)
        })
    except Exception as e:
        return jsonify({
            "error": str(e)
        }), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)