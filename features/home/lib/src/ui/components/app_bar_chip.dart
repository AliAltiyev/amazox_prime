import 'package:home/src/home.dart';

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
    final Size size = MediaQuery.sizeOf(context);

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          height: size.height / Dimensions.SIZE_9,
          width: size.width / Dimensions.SIZE_4,
          decoration: BoxDecoration(
            color: ApplicationColors.white.withOpacity(
              Dimensions.SIZE_0_8,
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.SIZE_24,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(
                Dimensions.SIZE_8,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: <AnimatedText>[
                  FadeAnimatedText(
                    _label ?? _label.orNull,
                    textStyle: AppFonts.normal14,
                    textAlign: TextAlign.center,
                  ),
                  ScaleAnimatedText(
                    _priority,
                    textStyle: AppFonts.normal14,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: Dimensions.SIZE_MINUS_20,
          right: Dimensions.SIZE_16,
          child: Container(
            height: size.height / Dimensions.SIZE_18,
            width: size.width / Dimensions.SIZE_4,
            decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    Dimensions.SIZE_2,
                    Dimensions.SIZE_2,
                  ),
                  blurRadius: Dimensions.SIZE_6,
                ),
              ],
              color: ApplicationColors.white,
              borderRadius: BorderRadius.circular(
                Dimensions.SIZE_40,
              ),
            ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.star,
                  color: ApplicationColors.green,
                  size: Dimensions.SIZE_40,
                ),
                Text(
                  _stars.toString(),
                  style: AppFonts.normal18,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
