import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/router/app_router.dart';
import 'package:asset_tracker/core/router/app_router.gr.dart';
import 'package:asset_tracker/core/sizes/app_edge_insets.dart';
import 'package:asset_tracker/core/sizes/app_size.dart';
import 'package:asset_tracker/core/utils/enums/auth_error_enum.dart';
import 'package:asset_tracker/core/utils/helpers/snackbar_helper.dart';
import 'package:asset_tracker/core/utils/validators/login_validator.dart';
import 'package:asset_tracker/core/utils/widgets/app_logo_widget.dart';
import 'package:asset_tracker/core/utils/widgets/custom_elevated_button.dart';
import 'package:asset_tracker/core/utils/widgets/custom_sized_box.dart';
import 'package:asset_tracker/presentation/views/login/widgets/auth_form_field.dart';
import 'package:asset_tracker/providers/providers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

mixin _LoginStateHelperMixin on ConsumerState<LoginView> {
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

class _LoginViewState extends ConsumerState<LoginView>
    with _LoginStateHelperMixin {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
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
                    isActive: !authState.isLoading,
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
                    isActive: !authState.isLoading,
                  ),
                  const CustomSizedBox.x2largeHeigth(),
                  authState.isLoading == false
                      ? _signInButtonBuilder()
                      : const SizedBox(
                          child: Center(child: CircularProgressIndicator()))
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

  Future<void> _onLogin() async {
    if (_formKey.currentState?.validate() != true) return;
    _formKey.currentState?.save();

    bool isSignedIn = await _signIn();

    if (isSignedIn) {
      _handleSuccess();
    } else {
      _handleFailure();
    }
  }

  Future<bool> _signIn() async {
    return await ref.read(authNotifierProvider.notifier).signIn(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }

  void _handleFailure() {
    AuthError? error = ref.read(authNotifierProvider).error;
    if (error != null) {
      SnackbarHelper.showSnackbar(context, error.message);
    }
  }

  void _handleSuccess() {
    SnackbarHelper.showSnackbar(context, ConstAppTexts.signInSuccessText);
    router.replace(const MainRoute());
  }
}
