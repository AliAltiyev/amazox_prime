import 'package:core_ui/core_ui.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String _url;

  const AppCachedNetworkImage({
    super.key,
    required String url,
  }) : _url = url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      useOldImageOnUrlChange: true,
      fit: BoxFit.fill,
      fadeInCurve: Curves.bounceIn,
      imageUrl: _url,
      filterQuality: FilterQuality.high,
      imageBuilder: (
        BuildContext context,
        ImageProvider<Object> imageProvider,
      ) =>
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fitHeight,
            isAntiAlias: true,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.SIZE_10,
          ),
        ),
      ),
      placeholder: (
        BuildContext context,
        String url,
      ) =>
          SpinKitFadingCircle(
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven
                  ? ApplicationColors.red
                  : ApplicationColors.green,
            ),
          );
        },
      ),
      errorWidget: (
        BuildContext context,
        String url,
        error,
      ) =>
          AppIcons.error,
    );
  }
}
