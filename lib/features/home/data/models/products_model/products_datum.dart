class ProductsDatum {
  int? id;
  String? storeName;
  String? storeImage;
  String? name;
  String? image;
  String? price;

  ProductsDatum({
    this.id,
    this.storeName,
    this.storeImage,
    this.name,
    this.image,
    this.price,
  });

  factory ProductsDatum.fromJson(Map<String, dynamic> json) => ProductsDatum(
        id: json['id'] as int?,
        storeName: json['store_name'] as String?,
        storeImage: json['store_image'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        price: json['price'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'store_name': storeName,
        'store_image': storeImage,
        'name': name,
        'image': image,
        'price': price,
      };
}
