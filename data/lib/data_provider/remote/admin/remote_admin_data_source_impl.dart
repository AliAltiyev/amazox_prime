import 'package:data/data.dart';

final class RemoteAdminDataSourceImpl implements RemoteAdminDataSource {
  final FirebaseFirestore firebaseFirestore;

  RemoteAdminDataSourceImpl({
    required this.firebaseFirestore,
  });

  @override
  Future<List<int>> getUsersPerDay() async {
    try {
      List<int> userCounts = <int>[];
      QuerySnapshot snapshot = await firebaseFirestore
          .collection('users')
          .orderBy('registrationDate', descending: true)
          .get();

      List<QueryDocumentSnapshot> documents = snapshot.docs;
      DateTime currentDate = DateTime.now();

      for (int i = 0; i < 7; i++) {
        DateTime date = currentDate.subtract(Duration(days: i));
        int count = 0;

        for (QueryDocumentSnapshot document in documents) {
          DateTime registrationDate = document['registrationDate'].toDate();
          if (registrationDate.year == date.year &&
              registrationDate.month == date.month &&
              registrationDate.day == date.day) {
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
