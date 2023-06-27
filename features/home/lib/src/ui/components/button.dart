import 'package:core/constants/app_constants.dart';
import 'package:core/resources/color_manager.dart';
import 'package:core/resources/style_manager.dart';
import 'package:core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class AddToCardButton extends StatelessWidget {
  final Function onPressed;

  const AddToCardButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: ColorManager.primaryButtonColor,
        elevation: ApplicationSize.s8,
        shadowColor: Colors.black,
      ),
      child: Text(AppConstants.addToCard,
          style: StyleManager.getMediumFontStyle()),
    );
  }
}
