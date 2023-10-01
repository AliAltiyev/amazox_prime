import 'package:data/data.dart';

final class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _fireStore;

  SettingsRemoteDataSourceImpl({
    required FirebaseStorage firebaseStorage,
    required FirebaseFirestore fireStore,
  })  : _firebaseStorage = firebaseStorage,
        _fireStore = fireStore;

  @override
  Future<String> changeAvatar(File imageFile) async {
    final String id = const Uuid().v4();

    final Reference storageReference =
        _firebaseStorage.ref().child('avatar/$id');

    final UploadTask task = storageReference.putFile(imageFile);
    await task.whenComplete(() => debugPrint('Avatar Uploaded'));

    final String getUploadedImage = await storageReference.getDownloadURL();

    final DocumentReference<Map<String, dynamic>> docRef = _fireStore
        .collection(FirebaseEnum.users.name)
        .doc(FirebaseAuth.instance.currentUser?.uid);

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
