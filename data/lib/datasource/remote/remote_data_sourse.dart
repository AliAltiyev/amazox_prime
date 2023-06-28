import 'package:data/data.dart';

interface class RemoteDataSource {
  Future<List<ProductModel>> getCoffees() async {
    List<ProductModel> list = <ProductModel>[];

    try {
      final QuerySnapshot<Map<String, dynamic>> firebaseFirestore =
          await FirebaseFirestore.instance
              .collection(FirebaseEnum.coffee.name)
              .get();

      for (final element in firebaseFirestore.docs) {
        list.add(ProductModel.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      throw CustomFireBaseException(e.toString());
    }
    return list;
  }
}
