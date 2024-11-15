import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:pinme/utils/image_utils.dart';
import 'package:pinme/views/authentication/verification/otp_screen.dart';
import 'package:pinme/views/guest/guest_screen.dart';
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:pinme/widgets/loader.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String verify = '';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool pop = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model){
        //model.initialize();
        // model.onSignupUserNameFocus();
        // model.onSignupEmailFocus();
        // model.onSignupPasswordFocus();
        // model.onSignupMobileFocus();
      },
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: WillPopScope(
            onWillPop: () async{
              return pop;
            },
            child: GestureDetector(
              onTap: (){
                context.unFocus();
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      Container(
                        height: 31.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                          color: ColorUtils.onboardHeading,
                          image: DecorationImage(image: AssetImage(
                            ImageUtils.loginBackground
                          ),
                            fit: BoxFit.fill
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.5.h,),
                            SizedBox(
                              height: 4.h,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){
                                  //Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_rounded,
                                    color: Colors.white,
                                  ),
                              )
                            ),
                            SizedBox(height: 4.h,),
                            Text("LOGIN",
                              style: TextStyle(
                                //fontFamily: FontUtils.avertaSemiBold,
                                fontSize: 3.5.t,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,

                              ),
                            ),

                            SizedBox(height: 2.h,),
                            Text("Enter your login details to\naccess your account",
                              style: TextStyle(
                                //fontFamily: FontUtils.avertaSemiBold,
                                fontSize: 2.5.t,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7.h,),
                      Container(
                        height: 47.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: 9.w
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 2.5.h,
                            horizontal: 4.w
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.w),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: Offset(0, 0)
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3.h,),
                             Text("Mobile Number",
                               style: TextStyle(
                                 //fontFamily: FontUtils.avertaSemiBold,
                                 fontSize: 2.5.t,
                                 fontWeight: FontWeight.w400,
                                 color: Colors.black,

                               ),
                             ),
                            SizedBox(height: 2.h,),
                            Container(
                              padding: EdgeInsets.only(left: 3.w,top: 0.h,bottom: 0.h),
                              height: 5.25.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(
                                    6,
                                  ),
                                  border: Border.all(color: Colors.grey.withOpacity(0.3))
                              ),
                              child: IntlPhoneField(
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: ColorUtils.onboardHeading,
                                //controller: model.loginPhoneController,
                                showCountryFlag: true,
                                showDropdownIcon: true,
                                dropdownIcon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.black,
                                  size: 2.5.h,
                                ),
                                autovalidateMode: AutovalidateMode.disabled,
                                dropdownIconPosition: IconPosition.trailing,
                                //dropDownIcon: Icon(Icons.),
                                //showDropdownIcon: false,
                                style: TextStyle(
                                  //fontFamily: FontUtils.avertaSemiBold,
                                  //   fontSize: 1.5.t,
                                  fontSize: 2.t,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.5),

                                ),
                                //autoValidate: false,
                                autofocus: false,
                                decoration: InputDecoration(
                                  suffixText: "",
                                  isDense: true,
                                  alignLabelWithHint: true,
                                  counterText: "",
                                  contentPadding: EdgeInsets.only(top: 0.h,left: 0.w,right: 0.w,bottom: 0.h),
                                  focusedBorder: InputBorder.none,
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 0.0.t,
                                  ),
                                  hintText: '55X XXX XXX',
                                  hintStyle: TextStyle(
                                    // color: Colors.grey.withOpacity(0.8),
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2.t
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                onTap: (){},
                                initialCountryCode: 'SA',
                                onChanged: (phone) {
                                  model.loginCountryCode = phone.countryCode ;
                                  model.loginPhoneController.text = phone.number;
                                  model.completeLoginPhoneNumber.text = phone.completeNumber;
                                  model.notifyListeners();
                                },
                              ),
                            ),
                            const Spacer(),
                            CustomButton1(
                              onTap: () async{
                                // await FirebaseAuth.instance.verifyPhoneNumber(
                                //   phoneNumber: model.completeLoginPhoneNumber.text,
                                //   verificationCompleted: (PhoneAuthCredential credential) {},
                                //   verificationFailed: (FirebaseAuthException e) {},
                                //   codeSent: (String verificationId, int? resendToken) {
                                //     LoginScreen.verify = verificationId;
                                //     model.navigationService.navigateTo(to: OtpScreen(index: 0,));
                                //   },
                                //   codeAutoRetrievalTimeout: (String verificationId) {},
                                // );
                                //model.navigationService.navigateTo(to: OtpScreen(index: 0,));
                                model.login();
                              },
                              margin: EdgeInsets.symmetric(
                                  horizontal: 2.w
                              ),
                              buttonColor: Colors.black,
                              child: model.isLoading1 == false ?
                              Text("SIGN IN",
                                style: TextStyle(
                                  fontSize: 1.8.t,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ) :
                                 const Loader(),
                            ),
                            SizedBox(height: 2.5.h,),
                            DecoratedCustomButton(
                              onTap: (){
                                model.navigationService.navigateTo(to: GuestScreen());
                                model.notifyListeners();
                              },
                              margin: EdgeInsets.symmetric(
                                  horizontal: 2.w
                              ),
                              text: 'CONTINUE AS GUEST',
                              buttonColor: Colors.white,
                              borderColor: Colors.black,
                              textColor: Colors.black,
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an account?",
                            style: TextStyle(
                              //fontFamily: FontUtils.avertaSemiBold,
                              fontSize: 1.8.t,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,

                            ),
                          ),
                          SizedBox(width: 1.w,),
                          Material(
                            child: InkWell(
                              onTap: (){
                                model.navigationService.navigateTo(to: const SignupScreen());
                              },
                              child: Text("Sign Up",
                                style: TextStyle(
                                  //fontFamily: FontUtils.avertaSemiBold,
                                  fontSize: 1.8.t,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
        );
      },
    );
  }
}



