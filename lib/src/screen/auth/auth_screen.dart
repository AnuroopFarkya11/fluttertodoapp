import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertodoapp/src/screen/auth/component/sign_in_component.dart';
import 'package:fluttertodoapp/src/utils/extensions/duration_extension.dart';


final authState = StateProvider((ref) => true);
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool status = true;

  void callback() {
    setState(() {
      status = !status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return AnimatedSwitcher(
      duration: 300.milliseconds,
      child: status ? SignInComponent() : SignInComponent(),
    );
  }
}
