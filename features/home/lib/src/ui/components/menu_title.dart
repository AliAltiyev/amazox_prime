import 'package:home/src/home.dart';

class HomeMenuTitle extends StatelessWidget {
  const HomeMenuTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(
            ApplicationPadding.PADDING_10,
          ),
          child: Text(
            StringConstant.restarants,
            style: AppFonts.normal18,
          ),
        ),
        TextButton(
          onPressed: () {
            //TODO: Add navigation
          },
          child: Row(
            children: <Widget>[
              Text(
                StringConstant.all,
                style: AppFonts.bold16.copyWith(
                  color: ApplicationColors.primaryButtonColor,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: ApplicationColors.primaryButtonColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
