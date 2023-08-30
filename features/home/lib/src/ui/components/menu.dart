import 'package:home/src/bloc/menu/menu_bloc.dart';
import 'package:home/src/home.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (BuildContext context, MenuState state) {
        return SizedBox(
          height: Dimensions.SIZE_120,
          child: ListView.builder(
            itemCount: state.menu.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemExtent: Dimensions.SIZE_120,
            itemBuilder: (BuildContext context, int index) {
              final Menu data = state.menu[index];
              return Column(
                children: <Widget>[
                  AnimatedContainer(
                    duration: DurationEnum.high.duration,
                    height: state.isMenuAnimated
                        ? Dimensions.SIZE_50
                        : Dimensions.SIZE_75,
                    child: SizedBox(
                      height: size.height / Dimensions.SIZE_12,
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<MenuBloc>()
                              .add(ChangeMenuItemSizeEvent());
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: Dimensions.SIZE_2,
                          child: CachedNetworkImage(
                            imageUrl: data.image,
                            fit: BoxFit.fill,
                            fadeInCurve: Curves.bounceIn,
                          ),
                        ),
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
      },
    );
  }
}
