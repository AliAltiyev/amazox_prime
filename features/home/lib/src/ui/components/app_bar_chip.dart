import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:core/extensions/string.dart';
import 'package:core/resources/color_manager.dart';
import 'package:core/resources/font_manager.dart';
import 'package:core/resources/style_manager.dart';
import 'package:core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class AppBarChip extends StatelessWidget {
  final String? _label;

  final double _stars;
  final String _priority;

  const AppBarChip({
    super.key,
    required String? label,
    required double starts,
    required String priority,
  })  : _label = label,
        _stars = starts,
        _priority = priority;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height / ApplicationSize.s9,
          width: size.width / ApplicationSize.s4,
          decoration: BoxDecoration(
            color: ColorManager.white.withOpacity(.8),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(ApplicationSize.s8),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  FadeAnimatedText(_label ?? _label.orEmpty,
                      textStyle: StyleManager.getMediumFontStyle(
                          fontFamily: FontManager.poppins),
                      textAlign: TextAlign.center),
                  ScaleAnimatedText(
                    _priority,
                    textStyle: StyleManager.getMediumFontStyle(
                        fontFamily: FontManager.poppins),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: ApplicationSize.s_20,
          right: ApplicationSize.s16,
          child: Container(
              height: size.height / ApplicationSize.s18,
              width: size.width / ApplicationSize.s4_5,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(ApplicationSize.s2, ApplicationSize.s2),
                      blurRadius: ApplicationSize.s6),
                ],
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(ApplicationSize.s40),
              ),
              child: Row(
                children: [
                  Icon(Icons.star,
                      color: ColorManager.green, size: ApplicationSize.s40),
                  Text(
                    _stars.toString(),
                    style: StyleManager.getMediumFontStyle(
                      fontSize: FontSize.s18,
                      fontFamily: FontManager.poppins,
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
