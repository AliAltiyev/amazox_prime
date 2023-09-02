import 'package:home/src/home.dart';

class HomeContent extends StatelessWidget {
  final PageController _pageController;
  final double _currentPage;
  final LoadedProductsState _state;

  const HomeContent({
    required PageController pageController,
    required double currentPage,
    required LoadedProductsState state,
    super.key,
  })  : _pageController = pageController,
        _currentPage = currentPage,
        _state = state;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: Dimensions.SIZE_1_6,
      alignment: Alignment.bottomCenter,
      child: PageView.builder(
        controller: _pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _state.products.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          if (index == Dimensions.SIZE_0) {
            return const SizedBox.shrink();
          }
          final Product product =
              _state.products[index - Dimensions.SIZE_1.toInt()];
          double value = _getTransformValue(index);
          final double opacity = value.clamp(
            Dimensions.SIZE_0_1,
            Dimensions.SIZE_1,
          );
          return Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.SIZE_40),
            child: SizedBox(
              height: Dimensions.SIZE_200,
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(
                    Dimensions.SIZE_3.toInt(),
                    Dimensions.SIZE_2.toInt(),
                    Dimensions.SIZE_0_8,
                  )
                  ..translate(
                      Dimensions.SIZE_0,
                      (MediaQuery.sizeOf(context).height / Dimensions.SIZE_3) *
                          (Dimensions.SIZE_1 - value).abs())
                  ..scale(value),
                child: Opacity(
                  opacity: opacity,
                  child: GestureDetector(
                    onTap: () {
                      context.read<HomeBloc>().add(
                            NavigateToProductDetailsScreenEvent(
                                _state.products[index].id),
                          );
                    },
                    child: AppCachedNetworkImage(
                      url: product.image,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double _getTransformValue(int index) {
    final double result = _currentPage - index + Dimensions.SIZE_1;
    final double value = Dimensions.SIZE_MINUS_0_4 * result + Dimensions.SIZE_1;
    return value;
  }
}
