import 'dart:io';

import 'package:admin/admin.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final ImagePicker _imagePicker;
  final SaveProductUseCase _saveProductUseCase;
  File? pickedImage;
  AdminBloc({
    required ImagePicker imagePicker,
    required SaveProductUseCase saveProductUseCase,
  })  : _imagePicker = imagePicker,
        _saveProductUseCase = saveProductUseCase,
        super(AdminInitial()) {
    on<PickImageFromGalleryEvent>(_onPickImageFromGallery);
    on<SaveProductEvent>(_onSaveProductEvent);
  }

  Future<void> _onPickImageFromGallery(
    PickImageFromGalleryEvent event,
    Emitter<AdminState> emit,
  ) async {
    try {
      final XFile? xFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (xFile == null) return;
      pickedImage = File(xFile.path);
    } catch (e) {
      emit(AdminFailedState(errorMessage: e.toString()));
    }
  }

  Future<void> _onSaveProductEvent(
    SaveProductEvent event,
    Emitter<AdminState> emit,
  ) async {
    await _saveProductUseCase(
        event.product,
        pickedImage ??
            File(
              StringConstant.emptyString,
            ));
  }
}
