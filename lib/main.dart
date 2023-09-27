import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/size_config.dart';
import 'package:pinme/views/add%20pins/add_new_pin2.dart';
import 'package:pinme/views/authentication/login/login_screen.dart';
import 'package:pinme/views/authentication/signup/signup_detail_screen.dart';
import 'package:pinme/views/authentication/signup/signup_screen.dart';
import 'package:pinme/views/authentication/verification/otp_screen.dart';
import 'package:pinme/views/home/home.dart';
import 'package:pinme/views/splash/splash_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configure();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        theme: ThemeData(
            primaryColor: ColorUtils.onboardHeading,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black,
            )
        ),
        home: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return const AddNewPin1();
          },
        );
      },
    );
  }
}

