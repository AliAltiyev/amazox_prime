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
      labelColor:
          isGoogleButton ? ApplicationColors.black : ApplicationColors.white,
      label: isGoogleButton
          ? StringConstant.singInWithGoogle
          : StringConstant.signIn,
      buttonColor: isGoogleButton
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
            if (_checkAdmin(context)) {
              context.read<AuthBloc>().add(SignInAsAdminEvent());
            } else {
              context.read<AuthBloc>().add(
                    SignInEvent(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    ),
                  );
            }
          }
        }
      },
    );
  }

  bool _checkAdmin(BuildContext context) {
    if (emailController.text == StringConstants.admin &&
        passwordController.text == StringConstants.adminPassword) {
      return true;
    } else {
      return false;
    }
  }
}
