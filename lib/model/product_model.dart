class Product {
  final int id;
  final String name;
  final double price;
  final String currency;
  final String makingTime;
  final double rating;
  final int ratingCount;
  final String imageUrl;
  final String orderDateTime;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.makingTime,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
    required this.orderDateTime,
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
      'orderDateTime': orderDateTime,
    };
  }

  // Convert from JSON to Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      currency: json['currency'] ?? '',
      makingTime: json['making_time'] ?? '',
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      ratingCount: json['rating_count'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      orderDateTime: json['orderDateTime'] ?? '',
    );
  }
}
