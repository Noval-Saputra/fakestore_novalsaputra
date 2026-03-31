class Products {
  final int id;
  final String title;
  final int price;
  final String category;
  final String image;
  final bool rating;

    Products({
        required this.id,
        required this.title,
        required this.price,
        required this.category,
        required this.image,
        required this.rating,
    });

factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        category: json['category'],
        image: json['image'],
        rating: json['rating'] ?? false,
    );
  }


Map<String, dynamic> toJson() {
    return {
        'id': id,
        'title': title,
        'price': price,
        'category': category,
        'image': image,
        'rating': rating,
    };
  }
  }

  