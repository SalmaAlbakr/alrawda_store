class ProductsModel {
  final String sender;
  final String text;
  final String image;
  final String price;
  final String price1;
  final String price2;

  ProductsModel({
    required Map<String, dynamic> data,
  })  : sender = data['sender']['stringValue'],
        text = data['text']['stringValue'],
        image = data['image']['stringValue'],
        price = data['price']['stringValue'],
        price1 = data['price1']['stringValue'],
        price2 = data['price2']['stringValue'];
}


