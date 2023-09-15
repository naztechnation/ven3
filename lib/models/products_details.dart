class ProductDetails {
  String? id;
  String? object;
  Brand? brand;
  Brand? category;
  String? code;
  String? description;
  String? image;
  String? name;
  String? price;
  int? quantity;
  String? size;

  ProductDetails(
      {this.id,
      this.object,
      this.brand,
      this.category,
      this.code,
      this.description,
      this.image,
      this.name,
      this.price,
      this.quantity,
      this.size});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    category =
        json['category'] != null ? new Brand.fromJson(json['category']) : null;
    code = json['code'];
    description = json['description'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['code'] = this.code;
    data['description'] = this.description;
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    return data;
  }
}

class Brand {
  String? id;
  String? object;
  String? name;

  Brand({this.id, this.object, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['name'] = this.name;
    return data;
  }
}
