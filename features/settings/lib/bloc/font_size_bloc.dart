import 'dart:async';

import 'package:settings/settings.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  final SaveFontSizeUsecase _saveFontSizeUsecase;
  final GetFontSizeUsecase _getFontSizeUsecase;

  FontSizeBloc({
    required SaveFontSizeUsecase saveFontSizeUsecase,
    required GetFontSizeUsecase getFontSizeUsecase,
  })  : _saveFontSizeUsecase = saveFontSizeUsecase,
        _getFontSizeUsecase = getFontSizeUsecase,
        super(FontSizeState(fontSize: FontSizeEntity())) {
    on<SaveFontSizeEvent>(_changeFontSize);
    on<GetFontSizeEvent>(_getFontSize);
  }

  Future<void> _changeFontSize(
    SaveFontSizeEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    _saveFontSizeUsecase.call(
      fontsize: event.fontSizeEntity,
    );
    emit(FontSizeState(fontSize: event.fontSizeEntity));
  }

  Future<void> _getFontSize(
    GetFontSizeEvent event,
    Emitter<FontSizeState> emit,
  ) async {
    final FontSizeEntity fontSize = _getFontSizeUsecase();

    emit(FontSizeState(fontSize: fontSize));
  }
}
