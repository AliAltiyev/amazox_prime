import 'package:auth/auth.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      label: StringConstant.signIn,
      onPressed: () async {
        await getIt<FirebaseAuth>().currentUser?.reload();
        FocusManager.instance.primaryFocus?.unfocus();
        FirebaseAuth.instance.currentUser?.reload();
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
