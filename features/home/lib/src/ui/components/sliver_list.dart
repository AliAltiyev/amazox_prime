import 'package:home/src/home.dart';

class SliverGridList extends StatefulWidget {
  const SliverGridList({
    super.key,
    required this.state,
  });

  final LoadedProductsState state;

  @override
  State<SliverGridList> createState() => _SliverGridListState();
}

class _SliverGridListState extends State<SliverGridList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            color: ApplicationColors.red,
          ),
        )
      ],
    );
  }
}
