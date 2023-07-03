import 'package:data/model/menu.dart';

import '../../data.dart';

final class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<List<ProductModel>> getCoffees() async {
    List<ProductModel> list = <ProductModel>[];

    try {
      final QuerySnapshot<Map<String, dynamic>> firebaseFireStore =
          await FirebaseFirestore.instance
              .collection(FirebaseEnum.coffee.name)
              .get();

      for (final element in firebaseFireStore.docs) {
        list.add(ProductModel.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
    return list;
  }

  @override
  Future<List<MenuModel>> getMenu() async {
    List<MenuModel> list = <MenuModel>[];

    try {
      final QuerySnapshot<Map<String, dynamic>> firebaseFireStore =
          await FirebaseFirestore.instance
              .collection(FirebaseEnum.menu.name)
              .get();

      for (final element in firebaseFireStore.docs) {
        list.add(MenuModel.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
    return list;
  }
}
