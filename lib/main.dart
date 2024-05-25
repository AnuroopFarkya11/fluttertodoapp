import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertodoapp/firebase_options.dart';
import 'package:fluttertodoapp/src/constants/app_colors.dart';
import 'package:fluttertodoapp/src/constants/app_constant.dart';
import 'package:fluttertodoapp/src/provider/app_providers.dart';
import 'package:fluttertodoapp/src/routes/route.dart';
import 'package:fluttertodoapp/src/theme/app_theme.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: TodoApp()));
}


class TodoApp extends StatelessWidget {
  TodoApp({super.key});

  ProviderContainer? _ref;
  AppConstants? appConstants;
  AppColors? appColors;
  AppTheme? appTheme;

  @override
  Widget build(BuildContext context) {

    _ref = ProviderContainer();
    appConstants = _ref?.read(appConstantProvider);
    appColors = _ref?.read(appColorProvider);
    appTheme = _ref?.read(appThemeProvider);

    AppRoute appRoute = AppRoute();

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appConstants!.title,
          themeMode: ThemeMode.dark,
          theme: appTheme!.lgt,
          darkTheme: appTheme!.drk,
          routes: appRoute.routes,
          initialRoute: appRoute.root,
        ),
      ),
    );
  }
}
