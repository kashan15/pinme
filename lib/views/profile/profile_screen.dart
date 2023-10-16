import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/dimensions.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:pinme/utils/image_utils.dart';
import 'package:pinme/views/add%20pins/add_new_pin1.dart';
import 'package:pinme/views/authentication/login/login_screen.dart';
import 'package:pinme/views/support/support_screen.dart';
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

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
                backgroundColor: ColorUtils.chatBackground,
                body: SingleChildScrollView(
                  //controller: ScrollController(),
                  child: Column(
                    children: [
                      SizedBox(height: 4.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.power_settings_new_rounded,
                              color: Colors.red,
                            ),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Profile",
                                      style: TextStyle(
                                        //fontFamily: FontUtils.avertaSemiBold,
                                        fontSize: 2.5.t,
                                        fontWeight: FontWeight.bold,
                                        color: ColorUtils.onboardHeading,
                                      ),
                                    ),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      Container(
                        height: 17.5.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: 6.w
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.25.h
                        ),
                        decoration: BoxDecoration(
                            color: ColorUtils.onboardHeading,
                            borderRadius: BorderRadius.circular(4.w),
                            image: DecorationImage(image: AssetImage(
                              ImageUtils.headerBackground1,
                            ),
                                fit: BoxFit.contain
                            )
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 6.h,
                              width: 13.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(2.5.w),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 3.h,
                                  child: Image.asset(
                                    ImageUtils.profileIcon,
                                    color: Colors.white,

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 0.75.h,),
                                Text("Good Morning",
                                  style: TextStyle(
                                    //fontFamily: FontUtils.avertaSemiBold,
                                    fontSize: 1.5.t,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                Text("Ahmed Yousuf",
                                  style: TextStyle(
                                    //fontFamily: FontUtils.avertaSemiBold,
                                    fontSize: 1.5.t,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),

                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 6.w
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Select Languages",
                                  style: TextStyle(
                                    //fontFamily: FontUtils.avertaSemiBold,
                                    fontSize: 1.8.t,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text("Arabic",
                                  style: TextStyle(
                                    //fontFamily: FontUtils.avertaSemiBold,
                                    fontSize: 1.8.t,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.75.h,),
                             Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 1,
                            ),
                            SizedBox(height: 0.75.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Set Up Pin Me",
                                  style: TextStyle(
                                    //fontFamily: FontUtils.avertaSemiBold,
                                    fontSize: 1.8.t,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text("1 2 3 4 5 6",
                                  style: TextStyle(
                                    //fontFamily: FontUtils.avertaSemiBold,
                                    fontSize: 1.8.t,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.75.h,),
                            Divider(
                              color: Colors.grey.withOpacity(0.5),
                              thickness: 1,
                            ),
                            SizedBox(height: 0.75.h,),
                            GestureDetector(
                              onTap: (){
                                model.navigationService.navigateTo(to: const SupportScreen());
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Support",
                                      style: TextStyle(
                                        //fontFamily: FontUtils.avertaSemiBold,
                                        fontSize: 1.8.t,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),

                                    Icon(
                                      Icons.support,
                                      size: 2.5.h,
                                      color: Colors.grey.withOpacity(0.8),
                                    )
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
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

  Widget customOTP(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        6, // Change the length according to your OTP requirements
            (index) {
          return Container(
            width: 50, // Adjust the width of each OTP field
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2.0, // Adjust the border width as needed
                  color: Colors.blue, // Change the border color
                ),
              ),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Handle OTP input changes
              },
            ),
          );
        },
      ),
    );
  }
}



