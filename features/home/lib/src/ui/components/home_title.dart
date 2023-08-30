import 'package:home/src/home.dart';

class HomeTitle extends StatelessWidget {
  final double _currentPage;
  final LoadedProductsState _state;
  const HomeTitle({
    required double currentPage,
    required LoadedProductsState state,
    super.key,
  })  : _currentPage = currentPage,
        _state = state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Dimensions.SIZE_0,
      left: Dimensions.SIZE_0,
      top: Dimensions.SIZE_40,
      height: Dimensions.SIZE_75,
      child: Column(
        children: <Widget>[
          Text(
            _state.products[_currentPage.toInt()].name,
            style: AppFonts.bold24,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${_state.products[_currentPage.toInt()].price.toString()} ${Currency.rubl.value}',
            style: AppFonts.bold18,
          ),
        ],
      ),
    );
  }
}
