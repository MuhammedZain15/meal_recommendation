class Recipe {
  final String id;
  final String name;
  final String summary;
  final String typeOfMeal;
  final int time;
  final String imageUrl;
  final List<Ingredient> ingredients;
  final Nutrition nutrition;
  final Directions directions;

  Recipe({
    required this.id,
    required this.name,
    required this.summary,
    required this.typeOfMeal,
    required this.time,
    required this.imageUrl,
    required this.ingredients,
    required this.nutrition,
    required this.directions,
  });
}

class Ingredient {
  final String name;
  final String quantity;
  final String unit;
  final String imageUrl;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.unit,
    required this.imageUrl,
  });
}

class Nutrition {
  final String calories;
  final String protein;
  final String carbs;
  final String fat;
  final List<String> vitamins;

  Nutrition({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.vitamins,
  });
}

class Directions {
  final String firstStep;
  final String secondStep;
  final List<String> additionalSteps;

  Directions({
    required this.firstStep,
    required this.secondStep,
    required this.additionalSteps,
  });
}
