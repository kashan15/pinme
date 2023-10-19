import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:stacked_services/stacked_services.dart' as stacked;
import 'package:stacked/stacked.dart';
import 'package:pinme/modules/navigation_service.dart'
as my_nav_service;

import '../utils/color_utils.dart';
import '../utils/image_utils.dart';
import '../views/authentication/login/login_screen.dart';
import '../views/authentication/verification/otp_screen.dart';
import '../widgets/custom_navbar.dart';

class MainViewModel extends BaseViewModel{
  var navigationService = my_nav_service.NavigationService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  String? loginCountryCode;
  String? errorMessage;
  TextEditingController loginPhoneController =
  TextEditingController();

  OtpFieldController otpFieldController = OtpFieldController();

  TextEditingController completeLoginPhoneNumber = TextEditingController();


  bool isLoading1 = false;
  bool isLoading2 = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = '';

  login() async{
    if (completeLoginPhoneNumber.text.isEmpty) {
      showErrorMessage1("Please Enter Phone Number");
    } else if (completeLoginPhoneNumber.text.length < 6) {
      showErrorMessage1("Please Enter Correct Phone Number");
      return;
    }
    else{
      isLoading1 = true;
      notifyListeners();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: completeLoginPhoneNumber.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          LoginScreen.verify = verificationId;
          isLoading1 = false;
          notifyListeners();
          navigationService.navigateTo(to: OtpScreen(index: 0,));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }

  verifyOtp(BuildContext context) async{
    isLoading2 = true;
    notifyListeners();
    try{
      PhoneAuthCredential credential =
      PhoneAuthProvider.credential(verificationId: LoginScreen.verify, smsCode: code);
      await auth.signInWithCredential(credential);
      isLoading2 = false;
      notifyListeners();
      navigationService.navigateTo(to: const BottomNavBar());
    }
    catch(e){
      print("wrong otp");
      // ignore: use_build_context_synchronously
      customDialogue(context);
    }
  }

  customDialogue(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 22.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: 6.w
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.w),
            ),
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                SizedBox(
                    height: 8.h,
                    child: Image.asset(ImageUtils.logoWhite1, color: ColorUtils.onboardHeading,))
                ,              SizedBox(height: 2.h,),
                Text("Verification Failed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontFamily: FontUtils.avertaSemiBold,
                      fontSize: 2.5.t,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.onboardHeading,
                      decoration: TextDecoration.none
                  ),
                ),
                SizedBox(height: 1.25.h,),
                Text("You Insert Wrong OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontFamily: FontUtils.avertaSemiBold,
                      fontSize: 2.2.t,
                      fontWeight: FontWeight.w700,
                      color: ColorUtils.blackColor,
                      decoration: TextDecoration.none
                  ),
                ),
                SizedBox(height: 2.5.h,),

              ],
            ),
          ),
        );
      },
    );
  }

  void showErrorMessage(String error) async {
    errorMessage = error;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    errorMessage = null;
    notifyListeners();
  }

  void showErrorMessage1(String error) async {
    ScaffoldMessenger.of(stacked.StackedService.navigatorKey!.currentContext!)
        .showSnackBar(SnackBar(
      behavior: SnackBarBehavior.fixed,
      // margin: EdgeInsets.all(20),
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorUtils.whiteColor,
          // fontFamily: FontUtils.PoppinsSemibold,
          fontSize: 2.t,
          fontWeight: FontWeight.w700
        ),
      ),
      backgroundColor: ColorUtils.onboardHeading,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      elevation: 10,
      duration: Duration(seconds: 3),
    ));
  }

  errorDialogue(BuildContext context, String text){
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 20.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                horizontal: 6.w
            ),
            decoration: BoxDecoration(
              color: ColorUtils.onboardHeading,
              borderRadius: BorderRadius.circular(4.w),
            ),
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                SizedBox(
                    height: 8.h,
                    child: Image.asset(ImageUtils.logoWhite1, color: ColorUtils.whiteColor,))
                ,SizedBox(height: 4.h,),
                Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontFamily: FontUtils.avertaSemiBold,
                      fontSize: 2.5.t,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.whiteColor,
                      decoration: TextDecoration.none
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }



  int locationTap = 0;
  int shareTap = 1;

  int gridSelection = 0;
}