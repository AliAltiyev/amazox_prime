import 'package:home/src/home.dart';

class HomeProductShadow extends StatelessWidget {
  const HomeProductShadow({
    required this.size,
    super.key,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Dimensions.SIZE_20,
      right: Dimensions.SIZE_20,
      bottom: -size.height * Dimensions.SIZE_0_2,
      height: size.height * Dimensions.SIZE_0_4,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ApplicationColors.disabledColor
                  .withOpacity(Dimensions.SIZE_0_2),
              blurRadius: Dimensions.SIZE_40,
              offset: Offset.zero,
              spreadRadius: Dimensions.SIZE_50,
            )
          ],
        ),
      ),
    );
  }
}
