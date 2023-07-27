import 'package:core_ui/core_ui.dart';

class AppRefreshView extends StatelessWidget {
  const AppRefreshView({
    super.key,
    required this.size,
    required this.child,
    required this.onRefresh,
  });
  final Widget child;
  final Size size;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      showChildOpacityTransition: true,
      springAnimationDurationInMilliseconds: 1200,
      backgroundColor: ApplicationColors.black,
      animSpeedFactor: 20,
      borderWidth: 2,
      key: const ValueKey<int>(1),
      color: ApplicationColors.primaryButtonColor,
      height: size.height / Dimensions.SIZE_4,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
