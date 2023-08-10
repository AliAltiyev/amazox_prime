import 'package:home/src/home.dart';

class AppSliverAppBar extends StatelessWidget {
  final Widget _child;

  const AppSliverAppBar({super.key, required Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SliverAppBar(
      centerTitle: false,
      shape: const RoundedRectangleBorder(),
      expandedHeight: size.height / ApplicationPadding.PADDING_4,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          children: <Widget>[
            Positioned.fill(
              child: _child,
            ),
            const Positioned(
              top: Dimensions.SIZE_120,
              left: Dimensions.SIZE_20,
              child: AppBarChip(
                label: StringConstant.overTwoHundredStarts,
                starts: Dimensions.SIZE_4,
                priority: StringConstant.good,
              ),
            ),
          ],
        ),
      ),
      title: Text(
        StringConstant.appName,
        style: AppFonts.normal24,
      ),
      floating: true,
    );
  }
}
