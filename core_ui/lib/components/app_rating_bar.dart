import 'package:core_ui/core_ui.dart';

class AppRatingBar extends StatelessWidget {
  const AppRatingBar({super.key, required this.rate});
  final double rate;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      glow: false,
      itemSize: 20,
      ignoreGestures: true,
      tapOnlyMode: false,
      onRatingUpdate: (value) {},
      initialRating: rate,
      maxRating: 5,
      direction: Axis.horizontal,
      itemCount: Dimensions.SIZE_5.toInt(),
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: ApplicationColors.primaryButtonColor,
      ),
    );
  }
}
