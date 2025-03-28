import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/home/data/models/recipe_model.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Current user
  User? get currentUser => _auth.currentUser;
  String? get currentUserId => currentUser?.uid;

  // Check if user has recipes
  Future<bool> hasUserRecipes() async {
    if (currentUserId == null) return false;

    final recipesSnapshot =
        await _firestore
            .collection('users')
            .doc(currentUserId)
            .collection('recipes')
            .limit(1)
            .get();

    return recipesSnapshot.docs.isNotEmpty;
  }

  // Create default recipes for user
  Future<void> createDefaultRecipesForUser() async {
    if (currentUserId == null) return;

    // Check if user already has recipes
    final hasRecipes = await hasUserRecipes();
    if (hasRecipes) {
      return;
    }


    // Batch write for better performance
    final batch = _firestore.batch();

    // Create sample recipes
    final recipes = _getSampleRecipes();

    // Add recipes to user's collection
    for (final recipe in recipes) {
      final docRef =
          _firestore
              .collection('users')
              .doc(currentUserId)
              .collection('recipes')
              .doc();

      batch.set(docRef, {
        ...recipe.toJson(),
        'userId': currentUserId,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    }

    // Execute batch
    await batch.commit();
  }

  // Sample recipes data
  List<RecipeModel> _getSampleRecipes() {
    final List<RecipeModel> recipes = [
      RecipeModel(
        id: 'default-1',
        name: 'Vegan Italian Pizza',
        summary:
            'A delicious plant-based pizza with Italian herbs and fresh vegetables.',
        typeOfMeal: 'Dinner',
        time: 30,
        imageUrl: 'assets/images/food1.png',
        ingredients: [
          IngredientModel(
            name: 'Pizza dough',
            quantity: '1',
            unit: 'ball',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Tomato sauce',
            quantity: '1/2',
            unit: 'cup',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Vegan cheese',
            quantity: '200',
            unit: 'g',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Bell peppers',
            quantity: '1',
            unit: 'whole',
            imageUrl: '',
          ),
        ],
        nutrition: NutritionModel(
          calories: '320',
          protein: '12',
          carbs: '48',
          fat: '9',
          vitamins: ['A', 'C', 'B12'],
        ),
        directions: DirectionsModel(
          firstStep: 'Preheat the oven to 450°F (230°C).',
          secondStep: 'Roll out the pizza dough on a floured surface.',
          additionalSteps: [
            'Spread tomato sauce over the dough.',
            'Sprinkle vegan cheese and add toppings.',
            'Bake for 15-20 minutes until crust is golden.',
          ],
        ),
        isTrending: true,
        isRecommended: true,
        isPublic: true,
      ),
      RecipeModel(
        id: 'default-2',
        name: 'Grilled Salmon',
        summary: 'Perfectly grilled salmon with lemon and herbs.',
        typeOfMeal: 'Dinner',
        time: 25,
        imageUrl: 'assets/images/food2.png',
        ingredients: [
          IngredientModel(
            name: 'Salmon fillet',
            quantity: '200',
            unit: 'g',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Lemon',
            quantity: '1',
            unit: 'whole',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Olive oil',
            quantity: '2',
            unit: 'tbsp',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Dill',
            quantity: '1',
            unit: 'tbsp',
            imageUrl: '',
          ),
        ],
        nutrition: NutritionModel(
          calories: '280',
          protein: '32',
          carbs: '2',
          fat: '15',
          vitamins: ['D', 'B12', 'Omega-3'],
        ),
        directions: DirectionsModel(
          firstStep: 'Preheat grill to medium-high heat.',
          secondStep:
              'Brush salmon with olive oil and season with salt and pepper.',
          additionalSteps: [
            'Place salmon skin-side down on the grill.',
            'Cook for 4-5 minutes on each side.',
            'Squeeze lemon juice over the salmon and garnish with dill.',
          ],
        ),
        isTrending: true,
        isRecommended: true,
        isPublic: true,
      ),
      RecipeModel(
        id: 'default-3',
        name: 'Classic Steak',
        summary: 'Perfectly seared steak with rosemary garlic butter.',
        typeOfMeal: 'Dinner',
        time: 14,
        imageUrl: 'assets/images/food4.png',
        ingredients: [
          IngredientModel(
            name: 'Ribeye steak',
            quantity: '300',
            unit: 'g',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Butter',
            quantity: '2',
            unit: 'tbsp',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Garlic',
            quantity: '3',
            unit: 'cloves',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Rosemary',
            quantity: '2',
            unit: 'sprigs',
            imageUrl: '',
          ),
          IngredientModel(
            name: 'Salt',
            quantity: '1',
            unit: 'tsp',
            imageUrl: '',
          ),
        ],
        nutrition: NutritionModel(
          calories: '450',
          protein: '42',
          carbs: '2',
          fat: '32',
          vitamins: ['B12', 'B6', 'Iron'],
        ),
        directions: DirectionsModel(
          firstStep:
              'Season the steak with salt and pepper and let it come to room temperature.',
          secondStep: 'Heat a cast-iron skillet until very hot. Add oil.',
          additionalSteps: [
            'Sear the steak for 3-4 minutes per side for medium-rare.',
            'Add butter, garlic, and rosemary. Baste the steak with the melted butter.',
            'Let rest for 5 minutes before slicing.',
          ],
        ),
        isTrending: false,
        isRecommended: true,
        isPublic: true,
      ),
    ];

    return recipes;
  }
}
