import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/contact_model.dart';
import 'ressources/app_colors.dart';
import 'screens/account_verification/account_verification_stepper_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/onBoad/onBoad_screen.dart';
import 'screens/otp/otp_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("contact");
  Hive.registerAdapter(ContactModelAdapter());

  // var path = Directory.current.path;
  // Hive.init(path);
  // Hive
  //   ..init(path)
  //   ..registerAdapter(ContactAdapter());

  // var box = await Hive.openBox('contactBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // initialBinding: BindingsBuilder(() {
      //   Get.lazyPut(() => CameraControler());
      // }),
      supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      // home: AccountVerificationStepperScreen(),
      home: MainScreen(),
      // home: OnBoardScreen(),
    );
  }
}
