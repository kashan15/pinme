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
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

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
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: (){
                                  model.navigationService.back();
                                  model.notifyListeners();
                                },
                                child: const Icon(Icons.arrow_back_rounded,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Support",
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
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 6.h
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 1.h,),
                            Text("Need a Help! Get in touch",
                              style: TextStyle(
                                //fontFamily: FontUtils.avertaSemiBold,
                                fontSize: 2.5.t,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.onboardHeading,
                              ),
                            ),
                            SizedBox(height: 4.h,),

                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 1.h,
                              ),
                              decoration: BoxDecoration(
                                color: ColorUtils.whiteColor,
                                borderRadius: BorderRadius.circular(2.5.w),
                                border: Border.all(
                                  color: ColorUtils.onboardHeading
                                )
                              ),
                              child: TextFormField(
                                cursorColor: ColorUtils.onboardHeading,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Subject',
                                  hintStyle: TextStyle(
                                    color: ColorUtils.onboardHeading,
                                      fontSize: 2.t,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                style: TextStyle(
                                  color: ColorUtils.onboardHeading,
                                    fontSize: 2.t,
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ),
                            SizedBox(height: 3.h,),

                            Container(
                              height: 28.h,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 1.h,
                                ),
                                decoration: BoxDecoration(
                                    color: ColorUtils.whiteColor,
                                    borderRadius: BorderRadius.circular(2.5.w),
                                    border: Border.all(
                                        color: ColorUtils.onboardHeading
                                    )
                                ),
                                child: TextFormField(
                                  cursorColor: ColorUtils.onboardHeading,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Write your message here...',
                                    hintStyle: TextStyle(
                                        color: ColorUtils.onboardHeading,
                                        fontSize: 1.8.t,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  style: TextStyle(
                                      color: ColorUtils.onboardHeading,
                                      fontSize: 1.8.t,
                                      fontWeight: FontWeight.w400
                                  ),
                                )
                            ),
                            SizedBox(height: 5.h,),

                            CustomButton(
                              onTap: (){

                              },
                              text: 'SEND',
                              buttonColor: ColorUtils.onboardHeading,
                              textColor: Colors.white,
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



