import 'package:data/model/menu.dart';
import 'package:domain/domain.dart';

abstract class MenuMapper {
  static toModel(Menu model) {
    return MenuModel(
      name: model.name,
      image: model.image,
    );
  }

  static toEntity(MenuModel model) {
    return Menu(
      name: model.name,
      image: model.image,
    );
  }
}
