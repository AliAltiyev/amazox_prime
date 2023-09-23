import 'package:data/data.dart';

final class RemoteOrderDataSourceImpl implements RemoteOrderDataSource {
  final FirebaseFirestore firebaseFirestore;

  const RemoteOrderDataSourceImpl({
    required this.firebaseFirestore,
  });

  @override
  Future<void> saveOrderToFirebase(UserOrderEntity order) async {
    try {
      final CollectionReference<Map<String, dynamic>> ordersCollection =
          firebaseFirestore.collection(FirebaseEnum.orders.name);

      Map<String, dynamic> orderData = order.toJson();
      orderData['products'] = order.products
          .map((ProductModel product) => product.toJson())
          .toList();
      await ordersCollection.add(orderData);
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
  }
}
