import 'package:onboarding/onboarding.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, super.key});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pageContent.image,
          height: size.height * .4,
        ),
        SizedBox(
          height: size.height * .03,
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
              SizedBox(height: size.height * .02),
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
                  backgroundColor: ApplicationColors.canvasColor,
                  foregroundColor: ApplicationColors.white,
                ),
                onPressed: () async {
                  await context.read<OnBoardingCubit>().cacheFirstTimer();
                  //TODO: Add navigation
                },
                child: Text(
                  'Get Started',
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
