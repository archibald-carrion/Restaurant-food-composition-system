from app import PrologInterpreter

def test_interpreter():
    interpreter = PrologInterpreter()
    
    # Test parsing and querying
    test_rules = [
        "vegan_friendly(mushroom).",
        "vegetarian_friendly(cheese).",
        "animal_product_meat(chicken).",
        "can_eat_meal(vegan, mushroom, rice).",
        "can_eat_meal(vegetarian, mushroom, cheese).",
        "can_eat_meal(omnivor, chicken, rice).",
    ]
    
    # Create a temporary test file
    with open('test_rules.pl', 'w') as f:
        for rule in test_rules:
            f.write(rule + '\n')
    
    # Load and test
    interpreter.load_from_file('test_rules.pl')
    
    tests = [
        ("vegan_friendly", ["mushroom"], True),
        ("vegetarian_friendly", ["cheese"], True),
        ("animal_product_meat", ["chicken"], True),
        ("can_eat_meal", ["vegan", "mushroom", "rice"], True),
        ("can_eat_meal", ["vegan", "chicken", "rice"], False),
    ]
    
    for predicate, args, expected in tests:
        result = interpreter.query(predicate, args)
        print(f"Testing {predicate}({', '.join(args)})")
        print(f"Expected: {expected}, Got: {result}")
        assert result == expected, f"Test failed for {predicate}({', '.join(args)})"
    
    print("All tests passed!")

if __name__ == "__main__":
    test_interpreter()