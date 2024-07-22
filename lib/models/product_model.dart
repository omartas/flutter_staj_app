class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(), // Ensure price is double
      description: json['description'],
      category: json['category'],
      imageUrl: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}

/*
// products listesi deneme amaçlı manuel oluşturulan ürünler listesidir.  
static var randomImageUrl = "https://picsum.photos/id/1/200/300";
final List<Product> products = [
    Product(id: 1, title: "name", description: "description", price: 1, imageUrl: randomImageUrl),
    Product(id: 2, title: "name", description: "description", price: 2, imageUrl: randomImageUrl),
    Product(id: 3, title: "name", description: "description", price: 3, imageUrl: randomImageUrl),
    Product(id: 4, title: "name", description: "description", price: 4, imageUrl: randomImageUrl),
    Product(id: 5, title: "name", description: "description", price: 5, imageUrl: randomImageUrl),
  ];

*/