import 'package:amazon_prime/index.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is LoadedMenuState) {
          return SizedBox(
            height: ApplicationSize.SIZE_120,
            child: ListView.builder(
              itemCount: state.menu.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemExtent: ApplicationSize.SIZE_120,
              itemBuilder: (context, index) {
                final data = state.menu[index];
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height / ApplicationSize.SIZE_12,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: ApplicationSize.SIZE_2,
                        child: CachedNetworkImage(
                          imageUrl: data.image,
                          fit: BoxFit.fill,
                          fadeInCurve: Curves.bounceIn,
                        ),
                      ),
                    ),
                    Text(
                      data.name,
                      style: AppFonts.bold14,
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state is LoadingMenuUState) {
          return const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
