import 'package:data/data.dart';

part 'menu.g.dart';

@JsonSerializable()
final class MenuModel {
  final String name;
  final String image;

  MenuModel({
    required this.name,
    required this.image,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return _$MenuModelFromJson(json);
  }

  Map<String, dynamic> toJson(MenuModel menuModel) {
    return _$MenuModelToJson(menuModel);
  }
}
