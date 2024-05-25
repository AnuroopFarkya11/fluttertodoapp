import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodoapp/src/provider/auth_provider.dart';
import 'package:fluttertodoapp/src/screen/auth/auth_screen.dart';
import 'package:fluttertodoapp/src/screen/dashboard/dashboard_screen.dart';


class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {


  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  DashBoard();
        } else {
          return const AuthScreen();
        }
      },
    );

  }
}
