import 'package:core/resources/font_manager.dart';
import 'package:core/resources/style_manager.dart';
import 'package:core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String _labelText;
  final TextEditingController _controller;

  const SearchTextField({
    super.key,
    required String labelText,
    required TextEditingController textEditingController,
  })  : _labelText = labelText,
        _controller = textEditingController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / ApplicationSize.s16,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(ApplicationPadding.p16)),
        ),
        elevation: ApplicationSize.s8,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: ApplicationPadding.p16),
          child: TextField(
            style: StyleManager.getMediumFontStyle(
                fontFamily: FontManager.poppins),
            controller: _controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: ApplicationPadding.p16),
              suffix: const Icon(Icons.search_outlined),
              hintText: _labelText,
              hintStyle: StyleManager.getMediumFontStyle(
                  fontFamily: FontManager.poppins),
            ),
          ),
        ),
      ),
    );
  }
}
