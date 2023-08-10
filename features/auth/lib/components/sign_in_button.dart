import 'package:auth/auth.dart';

class SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isGoogleButton;

  const SignInButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.isGoogleButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      labelColour:
      isGoogleButton ? ApplicationColors.black : ApplicationColors.white,
      label: isGoogleButton
          ? StringConstant.singInWithGoogle
          : StringConstant.signIn,
      buttonColour: isGoogleButton
          ? ApplicationColors.white
          : ApplicationColors.primaryButtonColor,
      onPressed: () async {
        await getIt<FirebaseAuth>().currentUser?.reload();
        FocusManager.instance.primaryFocus?.unfocus();
        FirebaseAuth.instance.currentUser?.reload();
        if (context.mounted) {
          if (isGoogleButton) {
            context.read<AuthBloc>().add(
              SignInWithGoogleEvent(),
            );
          }
        }
        if (formKey.currentState!.validate()) {
          if (context.mounted) {
            context.read<AuthBloc>().add(
              SignInEvent(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              ),
            );
          }
        }
      },
    );
  }
}
