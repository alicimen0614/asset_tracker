import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/sizes/app_edge_insets.dart';
import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:asset_tracker/core/utils/validators/login_validator.dart';
import 'package:asset_tracker/core/utils/widgets/app_logo_widget.dart';
import 'package:asset_tracker/core/utils/widgets/custom_elevated_button.dart';
import 'package:asset_tracker/core/utils/widgets/custom_sized_box.dart';
import 'package:asset_tracker/presentation/views/login/widgets/auth_form_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

mixin _LoginStateHelperMixin on State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginValidator _loginValidator = LoginValidator();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class _LoginViewState extends State<LoginView> with _LoginStateHelperMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            ConstAppTexts.signInText,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: AppEdgeInsets.medium,
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const CustomSizedBox.x3largeHeigth(),
                  AppLogoWidget.big(),
                  const CustomSizedBox.x2largeHeigth(),
                  AuthFormField(
                    textInputType: TextInputType.emailAddress,
                    label: ConstAppTexts.emailText,
                    hint: ConstAppTexts.enterEmailText,
                    textEditingController: _emailController,
                    validator: (value) => _loginValidator.validateEmail(value),
                    isObscure: false,
                  ),
                  const CustomSizedBox.xlargeHeigth(),
                  AuthFormField(
                    textEditingController: _passwordController,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) =>
                        _loginValidator.validatePassword(value),
                    label: ConstAppTexts.passwordText,
                    hint: ConstAppTexts.enterPasswordText,
                    isObscure: true,
                  ),
                  const CustomSizedBox.x2largeHeigth(),
                  _signInButtonBuilder()
                ],
              )),
        ));
  }

  Row _signInButtonBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          onTap: _onLogin,
          size: const Size(AppSize.defaultButtonWidth, AppSize.largeSize),
          title: ConstAppTexts.signInText,
        ),
      ],
    );
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() != false) {
      _formKey.currentState?.save();
    }
  }
}
