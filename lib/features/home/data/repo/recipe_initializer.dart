import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecipeInitializer {
  static Future<void> initializeRecipesIfNeeded(
    FirebaseFirestore firestore,
  ) async {
    try {
      // Get current user ID
      final User? currentUser = FirebaseAuth.instance.currentUser;
      final String? userId = currentUser?.uid;

      if (userId == null) {
        print('Warning: No user logged in during data initialization.');
        return; // Don't proceed if no user is logged in
      }

      print('Checking recipes for user: $userId');

      // Check if user document exists first
      final userDoc = await firestore.collection('users').doc(userId).get();
      if (!userDoc.exists) {
        // Create user document first
        await firestore.collection('users').doc(userId).set({
          'userId': userId,
          'email': currentUser?.email,
          'displayName': currentUser?.displayName,
          'createdAt': FieldValue.serverTimestamp(),
        });
        print('Created user document for $userId');
      }

      // Check if user has recipes
      final userRecipesSnapshot =
          await firestore
              .collection('users')
              .doc(userId)
              .collection('recipes')
              .limit(1)
              .get();
    } catch (e) {
      print('Error initializing recipes: $e');
    }
  }

  /*static Future<void> _addSampleRecipes(
    FirebaseFirestore firestore,
    String userId,
  ) async {
    try {
      final batch = firestore.batch();

      // Recipe data structures
      final recipes = [
        {
          'name': 'Vegan Italian Pizza',
          'summary':
              'A delicious plant-based pizza with Italian herbs and fresh vegetables.',
          'typeOfMeal': 'Dinner',
          'time': 30,
          'imageUrl': 'assets/images/food1.png',
          'isTrending': true,
          'isRecommended': true,
          'isPublic': true,
          'userId': userId, // Associate with user
          'ingredients': [
            {
              'name': 'Pizza dough',
              'quantity': '1',
              'unit': 'ball',
              'imageUrl': '',
            },
            {
              'name': 'Tomato sauce',
              'quantity': '1/2',
              'unit': 'cup',
              'imageUrl': '',
            },
            {
              'name': 'Vegan cheese',
              'quantity': '200',
              'unit': 'g',
              'imageUrl': '',
            },
            {
              'name': 'Bell peppers',
              'quantity': '1',
              'unit': 'whole',
              'imageUrl': '',
            },
          ],
          'nutrition': {
            'calories': '320',
            'protein': '12',
            'carbs': '48',
            'fat': '9',
            'vitamins': ['A', 'C', 'B12'],
          },
          'directions': {
            'firstStep': 'Preheat the oven to 450°F (230°C).',
            'secondStep': 'Roll out the pizza dough on a floured surface.',
            'additionalSteps': [
              'Spread tomato sauce over the dough.',
              'Sprinkle vegan cheese and add toppings.',
              'Bake for 15-20 minutes until crust is golden.',
            ],
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        },
        {
          'name': 'Grilled Salmon',
          'summary': 'Perfectly grilled salmon with lemon and herbs.',
          'typeOfMeal': 'Dinner',
          'time': 25,
          'imageUrl': 'assets/images/food2.png',
          'isTrending': true,
          'isRecommended': true,
          'isPublic': true,
          'userId': userId, // Associate with user
          'ingredients': [
            {
              'name': 'Salmon fillet',
              'quantity': '200',
              'unit': 'g',
              'imageUrl': '',
            },
            {'name': 'Lemon', 'quantity': '1', 'unit': 'whole', 'imageUrl': ''},
            {
              'name': 'Olive oil',
              'quantity': '2',
              'unit': 'tbsp',
              'imageUrl': '',
            },
            {'name': 'Dill', 'quantity': '1', 'unit': 'tbsp', 'imageUrl': ''},
          ],
          'nutrition': {
            'calories': '280',
            'protein': '32',
            'carbs': '2',
            'fat': '15',
            'vitamins': ['D', 'B12', 'Omega-3'],
          },
          'directions': {
            'firstStep': 'Preheat grill to medium-high heat.',
            'secondStep':
                'Brush salmon with olive oil and season with salt and pepper.',
            'additionalSteps': [
              'Place salmon skin-side down on the grill.',
              'Cook for 4-5 minutes on each side.',
              'Squeeze lemon juice over the salmon and garnish with dill.',
            ],
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        },
        {
          'name': 'Avocado Toast',
          'summary':
              'Simple and nutritious breakfast toast with creamy avocado.',
          'typeOfMeal': 'Breakfast',
          'time': 10,
          'imageUrl': 'assets/images/food3.png',
          'isTrending': true,
          'isRecommended': false,
          'isPublic': true,
          'userId': userId, // Associate with user
          'ingredients': [
            {
              'name': 'Bread',
              'quantity': '2',
              'unit': 'slices',
              'imageUrl': '',
            },
            {
              'name': 'Avocado',
              'quantity': '1',
              'unit': 'whole',
              'imageUrl': '',
            },
            {
              'name': 'Lemon juice',
              'quantity': '1',
              'unit': 'tsp',
              'imageUrl': '',
            },
            {
              'name': 'Red pepper flakes',
              'quantity': '1/4',
              'unit': 'tsp',
              'imageUrl': '',
            },
          ],
          'nutrition': {
            'calories': '280',
            'protein': '6',
            'carbs': '30',
            'fat': '14',
            'vitamins': ['K', 'C', 'B5'],
          },
          'directions': {
            'firstStep': 'Toast the bread slices.',
            'secondStep':
                'Mash the avocado and mix with lemon juice, salt, and pepper.',
            'additionalSteps': [
              'Spread the avocado mixture on the toast.',
              'Sprinkle with red pepper flakes.',
              'Optionally top with a fried egg or microgreens.',
            ],
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        },
        {
          'name': 'Classic Steak',
          'summary': 'Perfectly seared steak with rosemary garlic butter.',
          'typeOfMeal': 'Dinner',
          'time': 14,
          'imageUrl': 'assets/images/food4.png',
          'isTrending': false,
          'isRecommended': true,
          'isPublic': true,
          'userId': userId, // Associate with user
          'ingredients': [
            {
              'name': 'Ribeye steak',
              'quantity': '300',
              'unit': 'g',
              'imageUrl': '',
            },
            {'name': 'Butter', 'quantity': '2', 'unit': 'tbsp', 'imageUrl': ''},
            {
              'name': 'Garlic',
              'quantity': '3',
              'unit': 'cloves',
              'imageUrl': '',
            },
            {
              'name': 'Rosemary',
              'quantity': '2',
              'unit': 'sprigs',
              'imageUrl': '',
            },
            {'name': 'Salt', 'quantity': '1', 'unit': 'tsp', 'imageUrl': ''},
          ],
          'nutrition': {
            'calories': '450',
            'protein': '42',
            'carbs': '2',
            'fat': '32',
            'vitamins': ['B12', 'B6', 'Iron'],
          },
          'directions': {
            'firstStep':
                'Season the steak with salt and pepper and let it come to room temperature.',
            'secondStep': 'Heat a cast-iron skillet until very hot. Add oil.',
            'additionalSteps': [
              'Sear the steak for 3-4 minutes per side for medium-rare.',
              'Add butter, garlic, and rosemary. Baste the steak with the melted butter.',
              'Let rest for 5 minutes before slicing.',
            ],
          },
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
        },
      ];

      // Now create documents with user ID in the name
      for (var i = 0; i < recipes.length; i++) {
        final recipe = recipes[i];

        // Create a document ID that includes the user ID
        // Format: userId_recipe_index
        final docId = '${userId}_recipe_$i';

        // Add the document ID to the recipe data
        final recipeWithId = Map<String, dynamic>.from(recipe);
        recipeWithId['id'] = docId;

        // 1. Add to user recipes collection
        final userRecipeRef = firestore
            .collection('users')
            .doc(userId)
            .collection('recipes')
            .doc(docId);

        batch.set(userRecipeRef, recipeWithId);

        // 2. Add to public recipes collection if public
        if (recipe['isPublic'] == true) {
          final publicRecipeRef = firestore.collection('recipes').doc(docId);

          batch.set(publicRecipeRef, recipeWithId);
        }

        // 3. Make first two recipes favorites
        if (i < 2) {
          final favoriteRef = firestore
              .collection('users')
              .doc(userId)
              .collection('favorites')
              .doc(docId);

          batch.set(favoriteRef, {
            'recipeId': docId,
            'userId': userId,
            'timestamp': FieldValue.serverTimestamp(),
          });
        }
      }

      // Commit all changes
      await batch.commit();
      print(
        'Successfully created recipes for user $userId with user-specific IDs',
      );
    } catch (e) {
      print('Error adding sample recipes: $e');
      throw e;
    }
  }
}
*/
}
