import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertodoapp/src/provider/app_providers.dart';
import 'package:fluttertodoapp/src/provider/auth_provider.dart';
import 'package:fluttertodoapp/src/screen/auth/auth_screen.dart';
import 'package:fluttertodoapp/src/service/firebase_service/firebase_auth.dart';
import 'package:fluttertodoapp/src/utils/app_utils.dart';
import 'package:fluttertodoapp/src/utils/extensions/sizedbox_extension.dart';
import 'package:fluttertodoapp/src/widgets/textFeild/text_feild.dart';

class SignInComponent extends ConsumerStatefulWidget {
  const SignInComponent({super.key});

  @override
  ConsumerState<SignInComponent> createState() => _SignInComponentState();
}

class _SignInComponentState extends ConsumerState<SignInComponent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  AuthStates state = AuthStates.idle;
  AppUtils? appUtils;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appUtils = ref.read(appUtilsProvider);
    state = ref.watch(userAuthProvider);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.heightBox,
            _getIcon(),

            16.heightBox,
            _getAppTitle(),

            8.heightBox,
            _getAppSubtitle(),

            50.heightBox,
            AppTextField(
              emailController,
              "Email",
              svgPath: "envelope.svg",
            ),

            SizedBox(height: 20.h),
            // Textfild(password, password_F, 'Password', Icons.lock),
            AppTextField(
              passwordController,
              "Password",
              obscureText: true,
              svgPath: "lock.svg",
              // stateCallback: () {
              //   setState(() {});
              // },
            ),
            15.heightBox,
            // forget(),
            15.heightBox,

            login(),
            15.heightBox,
            Have()
          ],
        ),
      ),
    );
  }

  Widget Have() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have account?  ",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              ref.read(authState.notifier).state =
                  !ref.read(authState.notifier).state;
            },
            child: Text(
              "Sign up ",
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget login() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ElevatedButton(
          onPressed: _onLoginTap,
          child: state == AuthStates.loading
              ? SizedBox(height: 15, child: CircularProgressIndicator())
              : Text("Login"),
        ));
  }

  Padding forget() {
    return Padding(
      padding: EdgeInsets.only(left: 200.w),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot password?',
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  _getIcon() {
    return Image.asset(
      'assets/icons/icon.png',
      height: 70.sp,
    );
  }

  _getAppTitle() {
    return Text(
      "TODO",
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _getAppSubtitle() {
    return Text(
      "Tap into the pulse of the world",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.grey,
      ),
    );
  }

  _onLoginTap() async {
    try {
      ref
          .read(userAuthProvider.notifier)
          .signIn(emailController.text, passwordController.text);
    } on Exception catch (e) {
      appUtils?.showAppSnackBar(context: context, message: "${e}");
    }
  }
}
