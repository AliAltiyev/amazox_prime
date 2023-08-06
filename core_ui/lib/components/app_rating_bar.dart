import 'package:core_ui/core_ui.dart';

class AppRatingBar extends StatelessWidget {
  const AppRatingBar({
    required this.rate,
    super.key,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      glow: false,
      itemSize: Dimensions.SIZE_20,
      ignoreGestures: true,
      tapOnlyMode: false,
      onRatingUpdate: (value) {},
      initialRating: rate,
      maxRating: Dimensions.SIZE_5,
      itemCount: Dimensions.SIZE_5.toInt(),
      itemPadding: const EdgeInsets.symmetric(
        horizontal: ApplicationPadding.PADDING_4,
      ),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: ApplicationColors.primaryButtonColor,
      ),
    );
  }
}
