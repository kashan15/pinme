import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:pinme/utils/image_utils.dart';
import 'package:pinme/views/authentication/login/login_screen.dart';
import 'package:pinme/views/home/home.dart';
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';
import '../../../widgets/custom_textfield.dart';
import '../signup/signup_screen.dart';

class SignupDetail extends StatefulWidget {
  const SignupDetail({super.key});

  @override
  State<SignupDetail> createState() => _SignupDetailState();
}

class _SignupDetailState extends State<SignupDetail> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model){
      },
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
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
                        color: ColorUtils.onboardHeading,
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
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
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_rounded,
                                    color: Colors.white,
                                  ),
                                )
                            ),
                            SizedBox(height: 4.h,),
                            Text("Sign Up",
                              style: TextStyle(
                                //fontFamily: FontUtils.avertaSemiBold,
                                fontSize: 3.5.t,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,

                              ),
                            ),

                            SizedBox(height: 2.h,),
                            Text("Enter your personal details\nto create your account",
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
                      SizedBox(height: 5.5.h,),
                      Container(
                        height: 50.h,
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
                            // SizedBox(height: 0.h,),
                            Align(
                              alignment: Alignment.center,
                              child: Text("CREATE NEW ACCOUNT",
                                style: TextStyle(
                                  //fontFamily: FontUtils.avertaSemiBold,
                                  fontSize: 2.25.t,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,

                                ),
                              ),
                            ),

                            SizedBox(height: 3.5.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Full Name",
                                  style: TextStyle(
                                    fontSize: 1.8.t,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              // height: Get.height * 0.075,
                              padding: EdgeInsets.all(1.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 0.2.w
                                  )
                              ),
                              child:
                              CustomTextField1(
                                hintText: 'Type Here Your Name...',
                                hintFontSize: 2.2.t,
                                textColor: Colors.black,
                                hintColor: Colors.black.withOpacity(0.6),
                                fontSize: 2.2.t,
                                cursorColor: Colors.black,
                                controller: model.nameController, 
                                prefixIcon: Icon(
                                  Icons.do_not_disturb_on_total_silence,
                                size: 2.w,
                                  color: Colors.transparent,
                                )
                                // contentPadding: EdgeInsets.all(Get.width * 0.055),
                              ),
                            ),

                            SizedBox(height: 1.5.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Email",
                                  style: TextStyle(
                                    fontSize: 1.8.t,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              // height: Get.height * 0.075,
                              padding: EdgeInsets.all(1.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(2.w),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 0.2.w
                                  )
                              ),
                              child:
                              CustomTextField1(
                                  hintText: 'Type Here Your Name...',
                                  hintFontSize: 2.2.t,
                                  textColor: Colors.black,
                                  hintColor: Colors.black.withOpacity(0.6),
                                  fontSize: 2.2.t,
                                  cursorColor: Colors.black,
                                  controller: model.nameController,
                                  prefixIcon: Icon(
                                    Icons.do_not_disturb_on_total_silence,
                                    size: 2.w,
                                    color: Colors.transparent,
                                  )
                                // contentPadding: EdgeInsets.all(Get.width * 0.055),
                              ),
                            ),
                            const Spacer(),
                            CustomButton(
                              onTap: (){
                                model.navigationService.navigateTo(to: const Home());
                              },
                              margin: EdgeInsets.symmetric(
                                  horizontal: 2.w
                              ),
                              text: 'SIGN UP',
                              buttonColor: Colors.black,
                              textColor: Colors.white,
                            ),
                            SizedBox(height: 2.5.h,),



                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
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
                                model.navigationService.navigateTo(to: const LoginScreen());
                              },
                              child: Text("Sign In",
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
        );
      },
    );
  }
}



