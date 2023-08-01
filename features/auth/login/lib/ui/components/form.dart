import 'package:login/login.dart';

class FormContent extends StatefulWidget {
  const FormContent({Key? key}) : super(key: key);

  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailEditionController = TextEditingController();
  final TextEditingController _passwordEditionController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailEditionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Please enter a valid email';
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            _sizedBox16(),
            TextFormField(
              controller: _passwordEditionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )),
            ),
            _sizedBox16(),
            SizedBox(
              width: double.infinity,
              child: AppAuthButton(
                isSignUp: false,
                formKey: _formKey,
                text: "Вход",
              ),
            ),
            _sizedBox16(),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  thickness: 2,
                  endIndent: 50,
                  color: ApplicationColors.black,
                ),
                Text('или'),
                Divider(
                  endIndent: 50,
                  color: ApplicationColors.black,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: AppGoogleButton(
                onPressed: () {
                  //TODO add navigation
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  //TODO  Add no account yet
                },
                child: const Text('Еще нету Аккаунта?  Регистрация'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sizedBox16() => const SizedBox(height: 16);
}
