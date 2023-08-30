import 'package:product_details/product_details.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.size,
    required this.data,
  });

  final Size size;
  final Product data;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: <Widget>[
        IconButton(
            onPressed: () {
              //TODO: Add action
            },
            icon: const Icon(
              AppIcons.share,
              color: ApplicationColors.white,
            ))
      ],
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(
          Dimensions.SIZE_40,
        ),
        child: Container(
          width: size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Dimensions.SIZE_50,
              ),
              topRight: Radius.circular(
                Dimensions.SIZE_50,
              ),
            ),
            color: ApplicationColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.SIZE_50,
                left: ApplicationPadding.PADDING_20,
              ),
              child: Text(
                data.name,
                style: AppFonts.bold18,
              ),
            ),
          ),
        ),
      ),
      expandedHeight: size.height / Dimensions.SIZE_4,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: AppHeroTags.homeToDetails,
          child: AppCachedNetworkImage(
            url: data.image,
          ),
        ),
      ),
    );
  }
}
