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
      orderData[FirebaseEnum.products.name] = order.products
          .map((ProductModel product) => product.toJson())
          .toList();
      await ordersCollection.add(orderData);
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
  }

  @override
  Future<List<int>> getOrdersPerDay() async {
    try {
      List<int> userCounts = <int>[];
      QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
          .collection(FirebaseEnum.orders.name)
          .orderBy(FirebaseEnum.date.name, descending: true)
          .get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          snapshot.docs;
      DateTime currentDate = DateTime.now();

      for (int i = 0; i < 7; i++) {
        DateTime date = currentDate.subtract(Duration(days: i));
        int count = 0;

        for (QueryDocumentSnapshot<Map<String, dynamic>> document
            in documents) {
          final DateTime orderDate =
              DateFormat('yyyy-MM-dd').parse(document[FirebaseEnum.date.name]);
          if (orderDate.year == date.year &&
              orderDate.month == date.month &&
              orderDate.day == date.day) {
            count++;
          }
        }
        userCounts.add(count);
      }
      return userCounts.reversed.toList();
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
  }
}
