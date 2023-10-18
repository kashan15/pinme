import 'dart:async';
import 'dart:ui';

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  @override
  void initState() {
    super.initState();

    errorController = StreamController<ErrorAnimationType>();

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

  bool pop = false;



  customDialogue(){
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                //alignment: Alignment.center,
                height: 26.5.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 6.w
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 4.h,),
                    Text("Setup your Profile PIN",
                      style: TextStyle(
                        //fontFamily: FontUtils.avertaSemiBold,
                        fontSize: 2.5.t,
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.onboardHeading,
                      ),
                    ),
                    SizedBox(height: 1.h,),

                    Text("To avoid losing your permanent pin-codes,\ncreate a free account with Pin Me.\nGuest users have a 3 hour window before\npin-codes are deleted",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontFamily: FontUtils.avertaSemiBold,
                        fontSize: 1.8.t,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    //SizedBox(height: 1.h,),
                     Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                     Expanded(
                      child:  IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8.w)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.w),
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        SizedBox(
                                          height: 2.h,
                                          child: Image.asset(
                                            ImageUtils.emoji1,
                                          ),
                                        )
                                    ]
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              thickness: 0.5,
                            ),
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.w)
                                ),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.w),
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[
                                          SizedBox(
                                            height: 2.h,
                                            child: Image.asset(
                                              ImageUtils.emoji2,
                                            ),
                                          )
                                        ]
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model)async{
       // await customDialogue();
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
                                      Text("Home",
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
                            horizontal: 4.w
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
                        SizedBox(height: 4.h,),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Enter Pin Number",
                            style: TextStyle(
                              //fontFamily: FontUtils.avertaSemiBold,
                              fontSize: 1.8.t,
                              fontWeight: FontWeight.bold,
                              color: ColorUtils.onboardHeading,
                            ),
                          ),
                        ),
                        ),

                        SizedBox(height: 2.5.h,),

                        Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                            ),
                            child: PinCodeTextField(
                              appContext: context,
                              backgroundColor: Colors.white,

                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              enablePinAutofill: true,
                              length: 6,
                              obscureText: true,
                              obscuringCharacter: '*',
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v!.length < 3) {
                                  return "I'm from validator";
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 65,
                                fieldWidth: 45,
                                activeFillColor: Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration: const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                debugPrint("Completed");
                              },
                              // onTap: () {
                              //   print("Pressed");
                              // },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            hasError ? "*Please fill up all the cells properly" : "",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // SizedBox(height: 2.5.h,),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Flexible(
                                child: TextButton(
                                  child: Text("Reset",
                            style: TextStyle(
                              //fontFamily: FontUtils.avertaSemiBold,
                              fontSize: 1.8.t,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                                  onPressed: () {
                                    textEditingController.clear();
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(
                          height: 70.5.h,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: 6.w
                          ),
                          decoration: BoxDecoration(
                            color: ColorUtils.customYellow,
                            borderRadius: BorderRadius.circular(2.w)
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 2.h,),
                              Text("Home",
                                style: TextStyle(
                                  //fontFamily: FontUtils.avertaSemiBold,
                                  fontSize: 3.5.t,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Container(
                                height: 27.5.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: ColorUtils.onboardHeading,
                                  borderRadius: BorderRadius.circular(1.5.w),
                                  image: DecorationImage(image: AssetImage(
                                    ImageUtils.homeMap
                                  ),
                                    fit: BoxFit.contain
                                  )
                                ),
                              ),

                              SizedBox(height: 2.h,),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Accuracy",
                                      style: TextStyle(
                                        //fontFamily: FontUtils.avertaSemiBold,
                                        fontSize: 2.t,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text("16M",
                                      style: TextStyle(
                                        //fontFamily: FontUtils.avertaSemiBold,
                                        fontSize: 2.t,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 2.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w
                                ),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                     Icon(Icons.person,color: ColorUtils.onboardHeading),
                                    SizedBox(width: 4.w,),
                                    Text("PIN NAME",
                                      style: TextStyle(
                                        //fontFamily: FontUtils.avertaSemiBold,
                                        fontSize: 1.8.t,
                                        fontWeight: FontWeight.w500,
                                        color: ColorUtils.blackColor,
                                      ),
                                    ),
                                     Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                             Icon(Icons.location_on, color: ColorUtils.onboardHeading,),
                                            SizedBox(width: 4.w,),
                                            Text("LAND NAME",
                                              style: TextStyle(
                                                //fontFamily: FontUtils.avertaSemiBold,
                                                fontSize: 1.8.t,
                                                fontWeight: FontWeight.w500,
                                                color: ColorUtils.blackColor,
                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(height: 2.h,),
                              Container(
                                height: 11.h,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5.w
                                ),
                                decoration: BoxDecoration(
                                  color: ColorUtils.whiteColor,
                                  borderRadius: BorderRadius.circular(4.w),

                                  image: DecorationImage(image: AssetImage(
                                    ImageUtils.locationPic
                                  ),
                                    fit: BoxFit.fill
                                  )
                                ),
                              ),

                              SizedBox(height: 3.h,),
                              TextButton(
                                  onPressed: (){
                                   // model.navigationService.navigateTo(to: const AddNewPin1());
                                  },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4.w),
                                            side: BorderSide(color: Colors.red)
                                        )
                                    ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(
                                        horizontal: 6.w
                                      )),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    ColorUtils.onboardHeading
                                  )

                                ),
                                  child: Text("Go to location",
                                    style: TextStyle(
                                      //fontFamily: FontUtils.avertaSemiBold,
                                      fontSize: 1.8.t,
                                      fontWeight: FontWeight.w500,
                                      color: ColorUtils.whiteColor,
                                    ),
                                  ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 10.h,),
                        /// Verify Button
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // Container(
                        //   margin:
                        //   const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                        //   child: ButtonTheme(
                        //     height: 50,
                        //     child: TextButton(
                        //       onPressed: () {
                        //         formKey.currentState!.validate();
                        //         // conditions for validating
                        //         if (currentText.length != 6 || currentText != "123456") {
                        //           errorController!.add(ErrorAnimationType
                        //               .shake); // Triggering error shake animation
                        //           setState(() => hasError = true);
                        //         } else {
                        //           setState(
                        //                 () {
                        //               hasError = false;
                        //               snackBar("OTP Verified!!");
                        //             },
                        //           );
                        //         }
                        //       },
                        //       child: Center(
                        //         child: Text(
                        //           "VERIFY".toUpperCase(),
                        //           style: const TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   decoration: BoxDecoration(
                        //       color: Colors.green.shade300,
                        //       borderRadius: BorderRadius.circular(5),
                        //       boxShadow: [
                        //         BoxShadow(
                        //             color: Colors.green.shade200,
                        //             offset: const Offset(1, -2),
                        //             blurRadius: 5),
                        //         BoxShadow(
                        //             color: Colors.green.shade200,
                        //             offset: const Offset(-1, 2),
                        //             blurRadius: 5)
                        //       ]),
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



