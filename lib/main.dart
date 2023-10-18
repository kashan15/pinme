import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/size_config.dart';
import 'package:pinme/views/add%20pins/add_new_pin1.dart';
import 'package:pinme/views/add%20pins/add_new_pin2.dart';
import 'package:pinme/views/all%20pins/all_pins.dart';
import 'package:pinme/views/authentication/login/login_screen.dart';
import 'package:pinme/views/authentication/signup/signup_detail_screen.dart';
import 'package:pinme/views/authentication/signup/signup_screen.dart';
import 'package:pinme/views/authentication/verification/otp_screen.dart';
import 'package:pinme/views/guest/guest_screen.dart';
import 'package:pinme/views/home/home.dart';
import 'package:pinme/views/profile/profile_screen.dart';
import 'package:pinme/views/show%20pins/show_pins_.dart';
import 'package:pinme/views/splash/splash_screen.dart';
import 'package:pinme/views/support/support_screen.dart';
import 'package:pinme/widgets/custom_navbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            return const LoginScreen();
          },
        );
      },
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:pinme/utils/extensions.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Slidable Example',
//       home: Scaffold(
//         body: ListView(
//           children: [
//             Slidable(
//               // Specify a key if the Slidable is dismissible.
//               key: const ValueKey(0),
//
//               // The start action pane is the one at the left or the top side.
//               startActionPane: ActionPane(
//                 // A motion is a widget used to control how the pane animates.
//                 motion: const ScrollMotion(),
//
//                 // A pane can dismiss the Slidable.
//                 dismissible: DismissiblePane(onDismissed: () {}),
//
//                 // All actions are defined in the children parameter.
//                 children: const [
//                   // A SlidableAction can have an icon and/or a label.
//                   SlidableAction(
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFFFE4A49),
//                     foregroundColor: Colors.white,
//                     icon: Icons.delete,
//                     label: 'Delete',
//                   ),
//                   SlidableAction(
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFF21B7CA),
//                     foregroundColor: Colors.white,
//                     icon: Icons.share,
//                     label: 'Share',
//                   ),
//                 ],
//               ),
//
//               // The end action pane is the one at the right or the bottom side.
//               endActionPane: const ActionPane(
//                 motion: ScrollMotion(),
//                 children: [
//                   SlidableAction(
//                     // An action can be bigger than the others.
//                     flex: 2,
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFF7BC043),
//                     foregroundColor: Colors.white,
//                     icon: Icons.archive,
//                     label: 'Archive',
//                   ),
//                   SlidableAction(
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFF0392CF),
//                     foregroundColor: Colors.white,
//                     icon: Icons.save,
//                     label: 'Save',
//                   ),
//                 ],
//               ),
//
//               // The child of the Slidable is what the user sees when the
//               // component is not dragged.
//               child: const ListTile(title: Text('Slide me')),
//             ),
//             Slidable(
//               // Specify a key if the Slidable is dismissible.
//               key: const ValueKey(1),
//
//               // The start action pane is the one at the left or the top side.
//               startActionPane: const ActionPane(
//                 // A motion is a widget used to control how the pane animates.
//                 motion: ScrollMotion(),
//
//                 // All actions are defined in the children parameter.
//                 children: [
//                   // A SlidableAction can have an icon and/or a label.
//                   SlidableAction(
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFFFE4A49),
//                     foregroundColor: Colors.white,
//                     icon: Icons.delete,
//                     label: 'Delete',
//                   ),
//                   SlidableAction(
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFF21B7CA),
//                     foregroundColor: Colors.white,
//                     icon: Icons.share,
//                     label: 'Share',
//                   ),
//                 ],
//               ),
//
//               // The end action pane is the one at the right or the bottom side.
//               endActionPane: ActionPane(
//                 motion: const ScrollMotion(),
//                 dismissible: DismissiblePane(onDismissed: () {}),
//                 children: const [
//                   SlidableAction(
//                     // An action can be bigger than the others.
//                     flex: 2,
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFF7BC043),
//                     foregroundColor: Colors.white,
//                     icon: Icons.archive,
//                     label: 'Archive',
//                   ),
//                   SlidableAction(
//                     onPressed: doNothing,
//                     backgroundColor: Color(0xFF0392CF),
//                     foregroundColor: Colors.white,
//                     icon: Icons.save,
//                     label: 'Save',
//                   ),
//                 ],
//               ),
//
//               // The child of the Slidable is what the user sees when the
//               // component is not dragged.
//               child: const ListTile(title: Text('Slide me')),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void doNothing(BuildContext context) {}