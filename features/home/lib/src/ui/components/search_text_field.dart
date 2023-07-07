import 'package:home/src/home.dart';

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
  Widget build(
    BuildContext context,
  ) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / Dimensions.SIZE_16,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              ApplicationPadding.PADDING_16,
            ),
          ),
        ),
        elevation: Dimensions.SIZE_8,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ApplicationPadding.PADDING_16,
          ),
          child: TextField(
            style: AppFonts.normal14,
            controller: _controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: ApplicationPadding.PADDING_16,
              ),
              suffix: const Icon(
                Icons.search_outlined,
              ),
              hintText: _labelText,
              hintStyle: AppFonts.normal14,
            ),
          ),
        ),
      ),
    );
  }
}
