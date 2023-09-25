import 'package:core_ui/core_ui.dart';

class AppTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColor;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final bool? isDescription;
//
  const AppTextField({
    required this.controller,
    this.isDescription,
    this.maxLines,
    this.textInputAction,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.fillColor,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: maxLines,
        controller: controller,
        validator: overrideValidator
            ? validator
            : (String? value) {
                if (value == null || value.isEmpty) {
                  return StringConstant.requiredField;
                }
                return validator?.call(value);
              },
        keyboardType: keyboardType,
        obscureText: obscureText,
        readOnly: readOnly,
        decoration: isDescription == true
            ? InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.SIZE_20,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.SIZE_20,
                  ),
                  borderSide: const BorderSide(
                    color: ApplicationColors.disabledColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.SIZE_20,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.SIZE_20,
                  vertical: Dimensions.SIZE_20,
                ),
                filled: filled,
                fillColor: fillColor,
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: hintStyle ?? AppFonts.normal16,
              )
            : InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.SIZE_80,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.SIZE_80,
                  ),
                  borderSide: const BorderSide(
                    color: ApplicationColors.disabledColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Dimensions.SIZE_80,
                  ),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.SIZE_20,
                ),
                filled: filled,
                fillColor: fillColor,
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: hintStyle ?? AppFonts.normal16,
              ));
  }
}
