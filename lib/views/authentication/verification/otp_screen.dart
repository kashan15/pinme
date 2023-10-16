import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/dimensions.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:pinme/views/authentication/login/login_screen.dart';
import 'package:pinme/views/authentication/signup/signup_detail_screen.dart';
import 'package:pinme/views/authentication/signup/signup_screen.dart';
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/custom_navbar.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';

class OtpScreen extends StatefulWidget {
  int? index;
   OtpScreen({super.key,
   this.index
   });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.verticalPadding,),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(
                            horizontal: 2.w
                      ),
                        child:  SizedBox(
                            height: 4.h,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: (){
                                model.navigationService.back();
                              },
                              icon:  Icon(Icons.arrow_back_rounded,
                                color: ColorUtils.onboardHeading,
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w
                        ),
                        child: Text("Phone Verification",
                          style: TextStyle(
                            //fontFamily: FontUtils.avertaSemiBold,
                            fontSize: 4.t,
                            fontWeight: FontWeight.bold,
                            color: ColorUtils.onboardHeading,
                          ),
                        ),
                      ),

                      SizedBox(height: 2.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w
                        ),
                        child: Text("Enter your OTP code here",
                          style: TextStyle(
                            //fontFamily: FontUtils.avertaSemiBold,
                            fontSize: 2.t,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      SizedBox(height: 8.h,),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w
                          ),
                        child: OTPTextField(
                          length: 4,
                          // outlineBorderRadius: 15.w,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 60,
                          style: TextStyle(
                            //fontFamily: FontUtils.avertaSemiBold,
                            fontSize: 4.t,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          // otpFieldStyle: OtpFieldStyle(
                          //   borderColor: Colors.red,
                          //   backgroundColor: Colors.white,
                          //   disabledBorderColor: Colors.red,
                          // ),
                          isDense: true,
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          },
                        ),
                      ),
                      SizedBox(height: 10.h,),

                      CustomButton(
                        onTap: (){
                          widget.index == 0 ?
                          model.navigationService.navigateTo(to: const BottomNavBar()) :
                          model.navigationService.navigateTo(to: const BottomNavBar());
                        },
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.w
                        ),
                        text: 'VERIFY NOW',
                        buttonColor: ColorUtils.onboardHeading,
                        textColor: Colors.white,
                      ),


                    ],
                  )
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
            decoration: BoxDecoration(
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
              decoration: InputDecoration(
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



