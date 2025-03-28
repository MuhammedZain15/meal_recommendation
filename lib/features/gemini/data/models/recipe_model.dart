import '../../domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    required String id,
    required String name,
    required String summary,
    required String typeOfMeal,
    required int time,
    required String imageUrl,
    required List<IngredientModel> ingredients,
    required NutritionModel nutrition,
    required DirectionsModel directions,
  }) : super(
          id: id,
          name: name,
          summary: summary,
          typeOfMeal: typeOfMeal,
          time: time,
          imageUrl: imageUrl,
          ingredients: ingredients,
          nutrition: nutrition,
          directions: directions,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> json, String docId) {
    return RecipeModel(
      id: docId,
      name: json['name'] ?? '',
      summary: json['summary'] ?? '',
      typeOfMeal: json['typeOfMeal'] ?? '',
      time: json['time'] is int
          ? json['time']
          : int.tryParse(json['time'] ?? '0') ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((ingredient) => IngredientModel.fromJson(ingredient))
              .toList() ??
          [],
      nutrition: NutritionModel.fromJson(json['nutrition'] ?? {}),
      directions: DirectionsModel.fromJson(json['directions'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'summary': summary,
      'typeOfMeal': typeOfMeal,
      'time': time,
      'imageUrl': imageUrl,
      'ingredients': ingredients
          .map((ingredient) => (ingredient as IngredientModel).toJson())
          .toList(),
      'nutrition': (nutrition as NutritionModel).toJson(),
      'directions': (directions as DirectionsModel).toJson(),
    };
  }
}

class IngredientModel extends Ingredient {
  IngredientModel({
    required String name,
    required String quantity,
    required String unit,
    required String imageUrl,
  }) : super(
          name: name,
          quantity: quantity,
          unit: unit,
          imageUrl: imageUrl,
        );

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? '',
      unit: json['unit'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'unit': unit,
      'imageUrl': imageUrl,
    };
  }
}

class NutritionModel extends Nutrition {
  NutritionModel({
    required String calories,
    required String protein,
    required String carbs,
    required String fat,
    required List<String> vitamins,
  }) : super(
          calories: calories,
          protein: protein,
          carbs: carbs,
          fat: fat,
          vitamins: vitamins,
        );

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: json['calories'] ?? '',
      protein: json['protein'] ?? '',
      carbs: json['carbs'] ?? '',
      fat: json['fat'] ?? '',
      vitamins: (json['vitamins'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'vitamins': vitamins,
    };
  }
}

class DirectionsModel extends Directions {
  DirectionsModel({
    required String firstStep,
    required String secondStep,
    required List<String> additionalSteps,
  }) : super(
          firstStep: firstStep,
          secondStep: secondStep,
          additionalSteps: additionalSteps,
        );

  factory DirectionsModel.fromJson(Map<String, dynamic> json) {
    return DirectionsModel(
      firstStep: json['firstStep'] ?? '',
      secondStep: json['secondStep'] ?? '',
      additionalSteps: (json['additionalSteps'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstStep': firstStep,
      'secondStep': secondStep,
      'additionalSteps': additionalSteps,
    };
  }
}
