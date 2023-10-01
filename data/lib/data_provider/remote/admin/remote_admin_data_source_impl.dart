import 'package:data/data.dart';

final class RemoteAdminDataSourceImpl implements RemoteAdminDataSource {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  RemoteAdminDataSourceImpl(
      {required this.firebaseFirestore, required this.firebaseStorage});

  @override
  Future<List<int>> getUsersPerDay() async {
    try {
      List<int> userCounts = <int>[];
      QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
          .collection(FirebaseEnum.users.name)
          .orderBy(FirebaseEnum.registrationDate.name, descending: true)
          .get();

      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          snapshot.docs;
      DateTime currentDate = DateTime.now();

      for (int i = 0; i < 7; i++) {
        DateTime date = currentDate.subtract(Duration(days: i));
        int count = 0;

        for (QueryDocumentSnapshot<Map<String, dynamic>> document
            in documents) {
          DateTime registrationDate =
              document[FirebaseEnum.registrationDate.name].toDate();
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

  @override
  Future<List<UserModel>> getUsersByRegistrationDate() async {
    final List<UserModel> userList = <UserModel>[];

    try {
      final QuerySnapshot<Map<String, dynamic>> firebaseFireStore =
          await FirebaseFirestore.instance
              .collection(FirebaseEnum.users.name)
              .get();

      for (final QueryDocumentSnapshot<Map<String, dynamic>> element
          in firebaseFireStore.docs) {
        userList.add(UserModel.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      throw AppFireBaseException(e.toString());
    }
    return userList;
  }

  @override
  Future<void> addProduct(
    ProductModel productModel,
    File imageFile,
  ) async {
    final DocumentReference<Map<String, dynamic>> s = await firebaseFirestore
        .collection(FirebaseEnum.coffee.name)
        .add(productModel.toJson());

    await saveProductImage(imageFile, s.id);
  }

  Future<String> saveProductImage(File imageFile, String productId) async {
    final String id = const Uuid().v4();

    final Reference storageReference =
        firebaseStorage.ref().child('products/$id');

    final UploadTask task = storageReference.putFile(imageFile);
    await task.whenComplete(() => debugPrint('product image uploaded'));

    final String getUploadedImage = await storageReference.getDownloadURL();

    final DocumentReference<Map<String, dynamic>> docRef =
        firebaseFirestore.collection(FirebaseEnum.coffee.name).doc(productId);

    await docRef.update(<String, String>{'image': getUploadedImage});

    if (getUploadedImage.startsWith('gs://') ||
        getUploadedImage.startsWith('https://')) {
      return getUploadedImage;
    }

    final Reference ref = storageReference.storage.refFromURL(getUploadedImage);
    final String image = await ref.getDownloadURL();

    return image;
  }
}
