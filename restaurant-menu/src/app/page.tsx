'use client'; // Add this at the very top

import React, { useState } from 'react';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Utensils, Salad, AlignJustify } from 'lucide-react';

export default function RestaurantMenu() {
  const [selectedDiet, setSelectedDiet] = useState('');
  const [selectedMain, setSelectedMain] = useState('');
  const [selectedSide, setSelectedSide] = useState('');
  const [result, setResult] = useState('');

  const diets = [
    { value: 'omnivor', label: 'No Restrictions' },
    { value: 'vegetarian', label: 'Vegetarian' },
    { value: 'vegan', label: 'Vegan' },
    { value: 'lactose_intolerant', label: 'Lactose Intolerant' },
    { value: 'pasta_intolerant', label: 'Pasta Intolerant' }
  ];

  const mainDishes = ['lomito', 'pollo', 'pescado', 'atún', 'mushroom'];
  const sideDishes = ['papa', 'rice', 'mushroom', 'zucchini'];

  const commonMeals = [
    { name: 'Basic Pasta', components: ['pasta', 'orégano', 'tomate', 'aceite', 'sal'] },
    { name: 'Caesar Salad', components: ['lechuga', 'tomate', 'vinagre', 'sal'] },
    { name: 'Mushroom al Horno', components: ['mushroom', 'queso', 'mantequilla', 'sal'] },
    { name: 'Ice Cream', components: ['miel', 'leche', 'fresas'] }
  ];

  const checkMeal = () => {
    // This would actually call your Prolog backend
    setResult(`Checking if ${selectedDiet} can eat ${selectedMain} with ${selectedSide}...`);
  };

  return (
    <div className="p-4 max-w-4xl mx-auto">
      <Card className="mb-6">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Utensils className="h-6 w-6" />
            Restaurant Menu System
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid gap-4">
            <div>
              <label className="block mb-2 text-sm font-medium">Dietary Restriction</label>
              <Select onValueChange={setSelectedDiet}>
                <SelectTrigger>
                  <SelectValue placeholder="Select diet..." />
                </SelectTrigger>
                <SelectContent>
                  {diets.map(diet => (
                    <SelectItem key={diet.value} value={diet.value}>
                      {diet.label}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block mb-2 text-sm font-medium">Main Dish</label>
                <Select onValueChange={setSelectedMain}>
                  <SelectTrigger>
                    <SelectValue placeholder="Select main..." />
                  </SelectTrigger>
                  <SelectContent>
                    {mainDishes.map(dish => (
                      <SelectItem key={dish} value={dish}>
                        {dish}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              <div>
                <label className="block mb-2 text-sm font-medium">Side Dish</label>
                <Select onValueChange={setSelectedSide}>
                  <SelectTrigger>
                    <SelectValue placeholder="Select side..." />
                  </SelectTrigger>
                  <SelectContent>
                    {sideDishes.map(dish => (
                      <SelectItem key={dish} value={dish}>
                        {dish}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
            </div>

            <Button onClick={checkMeal} className="mt-4">
              Check Meal
            </Button>

            {result && (
              <div className="mt-4 p-4 bg-gray-100 rounded-md">
                {result}
              </div>
            )}
          </div>
        </CardContent>
      </Card>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Salad className="h-6 w-6" />
              Common Meals
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {commonMeals.map(meal => (
                <div key={meal.name} className="border-b pb-2">
                  <h3 className="font-medium">{meal.name}</h3>
                  <p className="text-sm text-gray-600">
                    {meal.components.join(', ')}
                  </p>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <AlignJustify className="h-6 w-6" />
              Results Log
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="h-[300px] overflow-y-auto bg-gray-50 p-4 rounded-md">
              {/* This would show a log of queries and results */}
              <p className="text-sm text-gray-600">No queries yet...</p>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
