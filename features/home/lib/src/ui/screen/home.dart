import 'package:core/constants/app_constants.dart';
import 'package:core/constants/image_constants.dart';
import 'package:core/di/di.dart';
import 'package:core/enums/duration.dart';
import 'package:core/extensions/duration.dart';
import 'package:core/resources/color_manager.dart';
import 'package:core/resources/font_manager.dart';
import 'package:core/resources/style_manager.dart';
import 'package:core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:home/src/bloc/home_bloc.dart';

import '../components/app_bar_chip.dart';
import '../components/card.dart';
import '../components/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeBloc _bloc = instance<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      _appBar(),
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.all(ApplicationSize.s8),
        child: SearchTextField(
            labelText: AppConstants.search,
            textEditingController: TextEditingController()),
      )),
      BlocProvider(
        create: (context) => _bloc,
        child: BlocBuilder<HomeBloc, ProductsState>(
          builder: (context, state) {
            if (state is LoadedProductsState) {
              return _loadedStateBody(state);
            } else if (state is LoadingProductsState) {
              return SliverToBoxAdapter(
                child: _loadingStateBody(),
              );
            } else {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }
          },
        ),
      ),
    ]));
  }

  SliverGrid _loadedStateBody(LoadedProductsState state) {
    return SliverGrid.builder(
      gridDelegate:
          AppConstants.instance.sliverGridDelegateWithFixedCrossAxisCount,
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final data = state.products[index];
        return CustomCard(product: data);
      },
    );
  }

  Center _loadingStateBody() {
    return Center(
        child: SpinKitSquareCircle(
      color: ColorManager.white,
      size: ApplicationSize.s50,
      controller: AnimationController(
          vsync: this, duration: DurationEnum.high.getDuration),
    ));
  }

  SliverAppBar _appBar() {
    Size size = MediaQuery.sizeOf(context);
    return SliverAppBar(
      centerTitle: false,
      shape: const RoundedRectangleBorder(),
      expandedHeight: size.height / ApplicationPadding.p4,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                ImagePaths.sliverAppBarBackground,
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
                top: ApplicationSize.s120,
                left: ApplicationSize.s20,
                child: AppBarChip(
                  label: AppConstants.overTwoHundredStarts,
                  starts: 7,
                  priority: AppConstants.good,
                )),
          ],
        ),
      ),
      title: Text(AppConstants.appName,
          style: StyleManager.getMediumFontStyle(
              fontFamily: FontManager.poppins, fontSize: FontSize.s24)),
      floating: true,
    );
  }
}
