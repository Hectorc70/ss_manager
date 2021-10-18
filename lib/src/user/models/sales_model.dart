class Sales {
  double total = 0.0;
  List<SaleModel> items = [];

  Sales();

  Sales.fromFirebase(List<dynamic> jsonList) {
    if (jsonList == null || jsonList == 0) return;

    for (final item in jsonList) {
      final sale =
          SaleModel.fromJson(item.data() as Map<String, dynamic>, item.id);

      total = total + double.parse(sale.total);
      items.add(sale);
    }
  }
}

class SaleModel {
  final idDocument;
  final product;
  final idProduct;
  final pieces;
  final total;
  final date;
  final idUser;
  SaleModel({
    this.idDocument,
    this.product,
    this.idProduct,
    this.pieces,
    this.total,
    this.date,
    this.idUser,
  });

  factory SaleModel.fromJson(Map<String, dynamic> data, id) => SaleModel(
        idDocument: id,
        product: data['product'],
        idProduct: data['idProduct'],
        pieces: data['pieces'],
        total: data['total'],
        date: data['date'],
        idUser: data['idUser'],
      );
}
