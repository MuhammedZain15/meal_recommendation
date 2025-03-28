class RecipeModel {
  final String id;
  final String name;
  final String summary;
  final String typeOfMeal;
  final int time;
  final String imageUrl;
  final List<IngredientModel> ingredients;
  final NutritionModel nutrition;
  final DirectionsModel directions;
  bool isFavorite;
  bool isTrending;
  bool isRecommended;
  bool isPublic;
  String? userId;

  RecipeModel({
    required this.id,
    required this.name,
    required this.summary,
    required this.typeOfMeal,
    required this.time,
    required this.imageUrl,
    required this.ingredients,
    required this.nutrition,
    required this.directions,
    this.isFavorite = false,
    this.isTrending = false,
    this.isRecommended = false,
    this.isPublic = true,
    this.userId,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json, String docId) {
    return RecipeModel(
      id: docId,
      name: json['name'] ?? '',
      summary: json['summary'] ?? '',
      typeOfMeal: json['typeOfMeal'] ?? '',
      time:
          json['time'] is int
              ? json['time']
              : int.tryParse(json['time'] ?? '0') ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map((ingredient) => IngredientModel.fromJson(ingredient))
              .toList() ??
          [],
      nutrition: NutritionModel.fromJson(json['nutrition'] ?? {}),
      directions: DirectionsModel.fromJson(json['directions'] ?? {}),
      isFavorite: json['isFavorite'] ?? false,
      isTrending: json['isTrending'] ?? false,
      isRecommended: json['isRecommended'] ?? false,
      isPublic: json['isPublic'] ?? true,
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'summary': summary,
      'typeOfMeal': typeOfMeal,
      'time': time,
      'imageUrl': imageUrl,
      'ingredients':
          ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'nutrition': nutrition.toJson(),
      'directions': directions.toJson(),
      'isFavorite': isFavorite,
      'isTrending': isTrending,
      'isRecommended': isRecommended,
      'isPublic': isPublic,
      'userId': userId,
    };
  }
}

class IngredientModel {
  final String name;
  final String quantity;
  final String unit;
  final String imageUrl;

  IngredientModel({
    required this.name,
    required this.quantity,
    required this.unit,
    required this.imageUrl,
  });

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

class NutritionModel {
  final String calories;
  final String protein;
  final String carbs;
  final String fat;
  final List<String> vitamins;

  NutritionModel({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.vitamins,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: json['calories'] ?? '',
      protein: json['protein'] ?? '',
      carbs: json['carbs'] ?? '',
      fat: json['fat'] ?? '',
      vitamins:
          (json['vitamins'] as List<dynamic>?)
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

class DirectionsModel {
  final String firstStep;
  final String secondStep;
  final List<String> additionalSteps;

  DirectionsModel({
    required this.firstStep,
    required this.secondStep,
    required this.additionalSteps,
  });

  factory DirectionsModel.fromJson(Map<String, dynamic> json) {
    return DirectionsModel(
      firstStep: json['firstStep'] ?? '',
      secondStep: json['secondStep'] ?? '',
      additionalSteps:
          (json['additionalSteps'] as List<dynamic>?)
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
