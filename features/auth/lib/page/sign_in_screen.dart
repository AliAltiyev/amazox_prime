import 'package:auth/auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.white,
      extendBodyBehindAppBar: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is AuthError) {
            Utils.showSnackBar(
              context,
              state.message,
            );
          } else if (state is SignedIn) {
            userProvider.initUser(state.user);
            context.read<AuthBloc>().add(
                  NavigateTosHomePageEvent(),
                );
          }
        },
        builder: (BuildContext context, AuthState state) {
          return GradientBackground(
            image: ImagePaths.authGradientBackground,
            child: SafeArea(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.SIZE_20,
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: Dimensions.SIZE_80,
                      ),
                      child: Text(
                        StringConstant.signInSlogan,
                        style: AppFonts.normal32,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Hero(
                          tag: AppHeroTags.helperText,
                          flightShuttleBuilder: AuthUtils.buildShuttle,
                          child: Text(
                            StringConstant.signInToYourAccount,
                            style: AppFonts.bold12,
                          ),
                        ),
                        Baseline(
                          baseline: Dimensions.SIZE_75,
                          baselineType: TextBaseline.alphabetic,
                          child: Hero(
                            tag: AppHeroTags.redirectText,
                            child: TextButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      NavigateToRegistrationPageEvent(),
                                    );
                              },
                              child: const Text(
                                StringConstant.registration,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_10,
                    ),
                    SignInForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          //TODO add forgot password feature
                        },
                        child: const Text(
                          StringConstant.forgotPassword,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_20,
                    ),
                    Hero(
                      tag: AppHeroTags.authButton,
                      child: state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SignInButton(
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: Dimensions.SIZE_10,
                    ),
                    Hero(
                      tag: AppHeroTags.authButton,
                      child: state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SignInButton(
                              isGoogleButton: true,
                              formKey: formKey,
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
