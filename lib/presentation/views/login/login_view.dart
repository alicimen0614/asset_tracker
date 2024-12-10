import 'package:asset_tracker/core/utils/extensions/device_size_extension.dart';
import 'package:asset_tracker/core/utils/validators/login_validator.dart';
import 'package:asset_tracker/core/utils/widgets/app_logo_widget.dart';
import 'package:asset_tracker/core/utils/widgets/custom_elevated_button.dart';
import 'package:asset_tracker/core/utils/widgets/custom_sizedbox.dart';
import 'package:asset_tracker/presentation/views/login/widgets/auth_form_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginValidator _loginValidator = LoginValidator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Giriş Yap",
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomSizedBox.height(context: context, ratio: 0.05),
                  AppLogoWidget(
                    height: context.deviceHeight * 0.20,
                  ),
                  CustomSizedBox.height(context: context, ratio: 0.05),
                  AuthFormField(
                    textInputType: TextInputType.emailAddress,
                    label: 'E-Posta',
                    hint: 'E-posta adresinizi giriniz',
                    textEditingController: _emailController,
                    validator: (value) => _loginValidator.validateEmail(value),
                    isObscure: false,
                  ),
                  CustomSizedBox.height(context: context, ratio: 0.03),
                  AuthFormField(
                    textEditingController: _passwordController,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) =>
                        _loginValidator.validatePassword(value),
                    label: 'Şifre',
                    hint: 'Şifrenizi giriniz',
                    isObscure: true,
                  ),
                  CustomSizedBox.height(context: context, ratio: 0.05),
                  CustomElevatedButton(
                    onTap: _onLogin,
                    title: "Giriş Yap",
                    size: Size(
                        context.deviceWidth * 0.5, context.deviceHeight * 0.05),
                  )
                ],
              )),
        ));
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() != false) {
      _formKey.currentState?.save();
    }
  }
}
