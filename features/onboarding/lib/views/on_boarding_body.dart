import 'package:onboarding/onboarding.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    required this.pageContent,
    super.key,
  });

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          pageContent.image,
          height: size.height / Dimensions.SIZE_3,
        ),
        const SizedBox(
          height: Dimensions.SIZE_20,
        ),
        Padding(
          padding: const EdgeInsets.all(
            ApplicationPadding.PADDING_20,
          ).copyWith(
            bottom: Dimensions.SIZE_0,
          ),
          child: Column(
            children: <Widget>[
              Text(
                pageContent.title,
                textAlign: TextAlign.center,
                style: AppFonts.normal24,
              ),
              const SizedBox(height: Dimensions.SIZE_20),
              Text(
                pageContent.description,
                textAlign: TextAlign.center,
                style: AppFonts.normal14,
              ),
              SizedBox(height: size.height * .05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 17,
                  ),
                  backgroundColor: ApplicationColors.primaryButtonColor,
                  foregroundColor: ApplicationColors.white,
                ),
                onPressed: () async {
                  await context.read<OnBoardingCubit>().cacheFirstTimer();

                  if (context.mounted) {
                    await context
                        .read<OnBoardingCubit>()
                        .navigateToAuthOrHome(context: context);
                  }
                },
                child: Text(
                  StringConstant.getStarted,
                  style: AppFonts.normal24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
