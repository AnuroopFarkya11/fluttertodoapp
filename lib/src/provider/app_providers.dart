import 'package:fluttertodoapp/src/constants/app_constant.dart';
import 'package:fluttertodoapp/src/service/firebase_service/firebase_auth.dart';
import 'package:fluttertodoapp/src/service/firebase_service/firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fluttertodoapp/src/constants/app_colors.dart';
import 'package:fluttertodoapp/src/theme/app_theme.dart';
import 'package:fluttertodoapp/src/utils/app_utils.dart';


final appConstantProvider = Provider((ref) => AppConstants());
final appUtilsProvider = Provider((ref) => AppUtils());
final appColorProvider = Provider((ref) => AppColors());
final appThemeProvider = Provider((ref) => AppTheme());


/// Firebase Provider
final firebaseAuthProvider = Provider((ref) =>  Authentication());
final fireStoreProvider = Provider((ref) =>  FireStoreManager());
