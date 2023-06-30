import 'package:alrawda_store/model/get_product_model/get_product_model.dart';
import 'package:dio/dio.dart';

class ProductRepo {
  final Dio dio = Dio();

  Future<List<ProductsModel>> getAllProduct() async {
    final response = await dio.get(
        "https://firestore.googleapis.com/v1/projects/alrawda-store/databases/(default)/documents/product");
    //print(response);
    final List<dynamic> documents = response.data['documents'];
    //print(documents);
    return documents.map((document) {
      final Map<String, dynamic> fields = document['fields'];
     // print(fields);
      return ProductsModel(data: fields);
    }).toList();
  }
}
// main() {
//   ProductRepo().getAllProduct();
// }