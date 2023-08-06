import 'package:auth/auth.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          AppTextField(
            controller: widget.emailController,
            hintText: StringConstant.emailAddress,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: Dimensions.SIZE_20,
          ),
          AppTextField(
            controller: widget.passwordController,
            hintText: StringConstant.password,
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                obscurePassword ? Icons.remove_red_eye : Icons.hide_source,
                color: ApplicationColors.disabledColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
