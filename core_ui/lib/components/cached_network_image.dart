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
      fadeInCurve: Curves.easeIn,
      imageUrl: _url,
      imageBuilder: (
        context,
        imageProvider,
      ) =>
          Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            isAntiAlias: true,
          ),
          borderRadius: BorderRadius.circular(
            ApplicationSize.SIZE_10,
          ),
        ),
      ),
      placeholder: (
        context,
        url,
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
        context,
        url,
        error,
      ) =>
          AppIcons.error,
    );
  }
}
