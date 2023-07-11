import 'package:data/data.dart';

final class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
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
              .orderBy(FirebaseEnum.name.name)
              .get();

      for (final element in firebaseFireStore.docs) {
        list.add(MenuModel.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
    return list;
  }

  @override
  Future<ProductModel> getProductsById(int productId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> firebaseFireStore =
          await FirebaseFirestore.instance
              .collection(FirebaseEnum.coffee.name)
              .where(
                FirebaseEnum.id.name,
                isEqualTo: productId,
              )
              .get();

      if (firebaseFireStore.docs.isEmpty) {
        throw AppFireBaseException(StringConstants.fireBaseDocsError);
      } else {
        final data = firebaseFireStore.docs.first.data();
        return ProductModel.fromJson(data);
      }
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
  }
}
