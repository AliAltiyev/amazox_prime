import 'package:onboarding/onboarding.dart';

import 'on_boarding_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  @override
  void initState() {
    context.read<OnBoardingCubit>().checkIfUserIsFirstTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<OnBoardingCubit, bool>(
        listener: (context, state) {
          if (!state) {
            context.read<OnBoardingCubit>().navigateToMain(
                  context: context,
                );
          }
        },
        child: GradientBackground(
          image: ImagePaths.onBoardingBackground,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                PageView(
                  controller: pageController,
                  children: const <Widget>[
                    OnBoardingBody(pageContent: PageContent.first()),
                    OnBoardingBody(pageContent: PageContent.second()),
                    OnBoardingBody(pageContent: PageContent.third()),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, .04),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    onDotClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: DurationEnum.normal.duration,
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 40,
                      activeDotColor: ApplicationColors.primaryButtonColor,
                      dotColor: ApplicationColors.primaryButtonColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
