import 'package:cloud_firestore/cloud_firestore.dart';

class Meal {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final int ingredientsCount;
  final int time;
  final int rating;
  final bool isFavorite;

  Meal({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.ingredientsCount,
    required this.time,
    required this.rating,
    required this.isFavorite,
  });

  factory Meal.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Meal(
      id: doc.id,
      title: data["title"] ?? "",
      subtitle: data["subtitle"] ?? "",
      image: data["image"] ?? "",
      ingredientsCount: data["ingredientsCount"] ?? 0,
      time: data["time"] ?? 0,
      rating: data["rating"] ?? 0,
      isFavorite: data["isFavorite"] ?? false,
    );
  }
}
