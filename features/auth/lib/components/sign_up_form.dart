import 'package:auth/auth.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.fullNameController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController fullNameController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          AppTextField(
            controller: widget.fullNameController,
            hintText: StringConstant.username,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: Dimensions.SIZE_20,
          ),
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
            maxLines: Dimensions.SIZE_1.toInt(),
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
          const SizedBox(
            height: Dimensions.SIZE_20,
          ),
          AppTextField(
            maxLines: Dimensions.SIZE_1.toInt(),
            controller: widget.confirmPasswordController,
            hintText: StringConstant.confirmPassword,
            obscureText: obscureConfirmPassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              icon: Icon(
                obscureConfirmPassword
                    ? Icons.remove_red_eye
                    : Icons.hide_source,
                color: ApplicationColors.disabledColor,
              ),
            ),
            validator: (String? value) {
              if (value != widget.passwordController.text) {
                return StringConstant.passwordsNotMatch;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
