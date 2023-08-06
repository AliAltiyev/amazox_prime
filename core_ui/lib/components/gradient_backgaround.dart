import 'package:core_ui/core_ui.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final String image;

  const GradientBackground({
    required this.child,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
