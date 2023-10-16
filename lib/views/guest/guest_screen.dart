import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:pinme/utils/image_utils.dart';
import 'package:pinme/views/authentication/verification/otp_screen.dart';
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';
import '../authentication/signup/signup_screen.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {

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
              return true;
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
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_rounded,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                              SizedBox(height: 4.h,),
                              Text("GUEST",
                                style: TextStyle(
                                  //fontFamily: FontUtils.avertaSemiBold,
                                  fontSize: 3.5.t,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,

                                ),
                              ),

                              SizedBox(height: 2.h,),
                              Text("You Can Continue As Guest\nIn PinMe App",
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
                          height: 43.h,
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
                                    fontSize: 1.5.t,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.withOpacity(0.8),

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
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 1.5.t
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  onTap: (){},
                                  initialCountryCode: 'SA',
                                  onChanged: (phone) {
                                    // model.signupCountryCode = phone.countryCode ;
                                    // model.signupPhoneController.text = phone.number;
                                    // model.completeSignupPhoneNumber.text = phone.completeNumber;
                                    // model.notifyListeners();
                                  },
                                ),
                              ),
                              const Spacer(),
                              CustomButton(
                                onTap: (){
                                  model.navigationService.navigateTo(to: OtpScreen(index: 0,));
                                },
                                margin: EdgeInsets.symmetric(
                                    horizontal: 2.w
                                ),
                                text: 'SIGN IN',
                                buttonColor: Colors.black,
                                textColor: Colors.white,
                              ),
                              SizedBox(height: 2.5.h,),

                            ],
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("Dont have an account?",
                        //       style: TextStyle(
                        //         //fontFamily: FontUtils.avertaSemiBold,
                        //         fontSize: 1.8.t,
                        //         fontWeight: FontWeight.w700,
                        //         color: Colors.black,
                        //
                        //       ),
                        //     ),
                        //     SizedBox(width: 1.w,),
                        //     Material(
                        //       child: InkWell(
                        //         onTap: (){
                        //           model.navigationService.navigateTo(to:  SignupScreen());
                        //         },
                        //         child: Text("Sign Up",
                        //           style: TextStyle(
                        //             //fontFamily: FontUtils.avertaSemiBold,
                        //             fontSize: 1.8.t,
                        //             fontWeight: FontWeight.w700,
                        //             color: Colors.black,
                        //
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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



