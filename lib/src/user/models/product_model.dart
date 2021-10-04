class Products {
  List<ProductModel> items = [];

  Products();

  Products.fromFirebase(List<dynamic> jsonList) {
    if (jsonList == null || jsonList == 0) return;

    for (final item in jsonList) {
      final mun = ProductModel.fromJson(item.data() as Map<String, dynamic>, item.id);
      items.add(mun);
    }
  }
}

class ProductModel {
  final idDocument;
  final name;
  final pieces;
  final price;
  final idUser;
  ProductModel({
    this.idDocument,
    this.name,
    this.pieces,
    this.price,
    this.idUser,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data, id) => ProductModel(
        idDocument: id,
        name: data['name'],
        pieces: data['pieces'],
        price: data['price'],
        idUser: data['user'],
      );
}
