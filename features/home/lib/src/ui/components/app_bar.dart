import 'package:home/src/home.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SliverAppBar(
      centerTitle: false,
      shape: const RoundedRectangleBorder(),
      expandedHeight: size.height / ApplicationPadding.PADDING_4,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        background: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                ImagePaths.sliverAppBarBackground,
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
              top: ApplicationSize.SIZE_120,
              left: ApplicationSize.SIZE_20,
              child: AppBarChip(
                label: StringConstant.overTwoHundredStarts,
                //A bit later will fetch from firebase
                starts: ApplicationSize.SIZE_4,
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
