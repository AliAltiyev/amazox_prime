import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/enums/firebase.dart';
import 'package:core/exceptions/firebase.dart';
import 'package:data/model/product.dart';

final class RemoteDataSource {
  Future<List<ProductModel>> getCoffees() async {
    List<ProductModel> list = [];

    try {
      final fireStore = await FirebaseFirestore.instance
          .collection(FirebaseEnum.coffee.name)
          .get();

      for (var element in fireStore.docs) {
        list.add(ProductModel.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      throw CustomFireBaseException(e.toString());
    }
    return list;
  }
}
