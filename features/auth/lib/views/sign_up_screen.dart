import 'package:education_app_tutorial/core/common/providers/user_provider.dart';
import 'package:education_app_tutorial/core/common/widgets/gradient_background.dart';
import 'package:education_app_tutorial/core/common/widgets/rounded_button.dart';
import 'package:education_app_tutorial/core/res/fonts.dart';
import 'package:education_app_tutorial/core/res/res.dart';
import 'package:education_app_tutorial/core/utils/utils.dart';
import 'package:education_app_tutorial/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:education_app_tutorial/src/auth/presentation/utils/auth_heroes.dart';
import 'package:education_app_tutorial/src/auth/presentation/views/sign_in_screen.dart';
import 'package:education_app_tutorial/src/auth/presentation/widgets/sign_up_form.dart';
import 'package:education_app_tutorial/src/dashboard/presentation/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
            context.read<UserProvider>().initUser(state.user);
            Navigator.pushReplacementNamed(context, Dashboard.routeName);
          }
        },
        builder: (context, state) {
          return GradientBackground(
            image: Res.authGradientBackground,
            child: SafeArea(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const Hero(
                      tag: AuthHeroes.pageTitle,
                      child: Padding(
                        padding: EdgeInsets.only(right: 80),
                        child: Text(
                          'Easy to learn, discover more skills',
                          style: TextStyle(
                            fontFamily: Fonts.aeonik,
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Hero(
                      tag: AuthHeroes.helperText,
                      child: Text(
                        'Sign up for an account',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Hero(
                      tag: AuthHeroes.redirectText,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              SignInScreen.routeName,
                            );
                          },
                          child: const Text('Already have an account?'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SignUpForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      fullNameController: fullNameController,
                      confirmPasswordController: confirmPasswordController,
                      formKey: formKey,
                    ),
                    const SizedBox(height: 30),
                    Hero(
                      tag: AuthHeroes.authButton,
                      child: state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : RoundedButton(
                              label: 'Sign Up',
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        SignUpEvent(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
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
}
