class Product{
  Product(this.id, this.name, this.price, this.description, this.image);
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;

  factory Product.fromJson(Map<String, dynamic>json){
    return Product(
      json['id'],
      json['title'], 
      json['price'].toDouble(), 
      json['description'], 
      json['image']);
  }
}