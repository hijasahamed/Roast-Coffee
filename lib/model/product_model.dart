// class Product {
//   final int id;
//   final String name;
//   final double price;
//   final String currency;
//   final String makingTime;
//   final double rating;
//   final int ratingCount;
//   final String imageUrl;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.currency,
//     required this.makingTime,
//     required this.rating,
//     required this.ratingCount,
//     required this.imageUrl,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'].toDouble(),
//       currency: json['currency'],
//       makingTime: json['making_time'],
//       rating: json['rating'].toDouble(),
//       ratingCount: json['rating_count'],
//       imageUrl: json['image_url'],
//     );
//   }
// }


class Product {
  final int id;
  final String name;
  final double price;
  final String currency;
  final String makingTime;
  final double rating;
  final int ratingCount;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.makingTime,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
  });

  // Convert Product to a Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'currency': currency,
      'makingTime': makingTime,
      'rating': rating,
      'ratingCount': ratingCount,
      'imageUrl': imageUrl,
    };
  }

  // Convert from JSON to Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      currency: json['currency'],
      makingTime: json['making_time'],
      rating: json['rating'].toDouble(),
      ratingCount: json['rating_count'],
      imageUrl: json['image_url'],
    );
  }
}