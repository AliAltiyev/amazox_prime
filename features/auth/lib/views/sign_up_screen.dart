import 'package:auth/auth.dart';
import 'package:auth/components/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserProvider _userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: ApplicationColors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            Utils.showSnackBar(context, state.message);
          } else if (state is SignedUp) {
            context.read<AuthBloc>().add(
                  SignInEvent(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
          } else if (state is SignedIn) {
            _userProvider.initUser(state.user);
            context.read<AuthBloc>().add(
                  NavigateTosHomePageEvent(),
                );
          }
        },
        builder: (context, state) {
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
                    Hero(
                      tag: AppHereos.pageTitle,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: Dimensions.SIZE_80,
                        ),
                        child: Text(StringConstant.signUpSlogan,
                            style: AppFonts.normal32),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_10,
                    ),
                    Hero(
                      tag: AppHereos.helperText,
                      child: Text(
                        StringConstant.signUpToYourAccount,
                        style: AppFonts.normal14,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_10,
                    ),
                    Hero(
                      tag: AppHereos.redirectText,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  NavigateTosSignInPageEvent(),
                                );
                          },
                          child: const Text(
                            StringConstant.alreadyHaveAnAccount,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_10,
                    ),
                    SignUpForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      fullNameController: fullNameController,
                      confirmPasswordController: confirmPasswordController,
                      formKey: formKey,
                    ),
                    const SizedBox(
                      height: Dimensions.SIZE_30,
                    ),
                    Hero(
                      tag: AppHereos.authButton,
                      child: RoundedButton(
                        label: StringConstant.signUp,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  SignUpEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    name: fullNameController.text.trim(),
                                  ),
                                );
                          }
                        },
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
    fullNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
