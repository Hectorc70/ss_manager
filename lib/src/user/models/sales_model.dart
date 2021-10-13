

class SaleModel {
  final idDocument;
  final product;
  final pieces;
  final total;
  final date;
  final idUser;
  SaleModel({
    this.idDocument,
    this.product,
    this.pieces,
    this.total,
    this.date,
    this.idUser,
  });

  factory SaleModel.fromJson(Map<String, dynamic> data, id) => SaleModel(
        idDocument: id,
        product: data['product'],
        pieces: data['pieces'],
        total: data['total'],
        date: data['date'],
        idUser: data['user'],
      );
}
