import 'dart:io';

import 'package:domain/domain.dart';

final class SaveProductUseCase {
  final AdminRepository _adminRepository;

  SaveProductUseCase({
    required AdminRepository adminRepository,
  }) : _adminRepository = adminRepository;

  Future<void> call(
    Product product,
    File imageFile,
  ) async {
    return _adminRepository.saveProductToFirebase(
      product,
      imageFile,
    );
  }
}
