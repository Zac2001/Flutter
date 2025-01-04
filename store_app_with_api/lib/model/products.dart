// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Products {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  

  Products copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
  }) {
    return Products(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) => Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Products(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image)';
  }

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.price == price &&
      other.description == description &&
      other.category == category &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      description.hashCode ^
      category.hashCode ^
      image.hashCode;
  }
}
