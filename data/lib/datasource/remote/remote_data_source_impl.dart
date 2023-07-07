import '../../data.dart';

final class RemoteDataSourceImpl extends RemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  RemoteDataSourceImpl(this.firebaseFirestore);

  @override
  Future<List<ProductModel>> getCoffees() async {
    List<ProductModel> list = <ProductModel>[];

    try {
      final QuerySnapshot<Map<String, dynamic>> firebaseFireStore =
          await firebaseFirestore.collection(FirebaseEnum.coffee.name).get();

      for (final element in firebaseFireStore.docs) {
        list.add(ProductModel.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
    return list;
  }

  @override
  Future<ProductModel> getCoffeeById(int productId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> firebaseFireStore =
          await firebaseFirestore
              .collection(FirebaseEnum.coffee.name)
              .where(
                FirebaseEnum.id.name,
                isEqualTo: productId,
              )
              .get();

      if (firebaseFireStore.docs.isEmpty) {
        throw AppFireBaseException(
          StringConstants.fireBaseDocsError,
        );
      }

      final Map<String, dynamic> coffeeData =
          firebaseFireStore.docs.first.data();
      return ProductModel(
        coffeeData['name'],
        coffeeData['description'],
        coffeeData['image'],
        coffeeData['price'],
        coffeeData['ml'],
        coffeeData['id'],
        coffeeData['bigDescription'],
        coffeeData['rate'],
      );
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
  }
}
