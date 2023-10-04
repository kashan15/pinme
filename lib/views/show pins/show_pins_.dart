import 'dart:async';

import 'package:flutter/material.dart';
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
import 'package:pinme/views/authentication/login/login_screen.dart';
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/custom_textfield.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';

class ShowPin1 extends StatefulWidget {
  const ShowPin1({super.key});

  @override
  State<ShowPin1> createState() => _ShowPin1State();
}

class _ShowPin1State extends State<ShowPin1> with TickerProviderStateMixin{
  @override

  List optionsList1 = [
    {
      'name': 'HOME',
    },{
      'name': 'OFFICE',
    },{
      'name': 'FRIENDS',
    },
  ];

  List optionsList2 = [
    {
      'name': '30 MIN',
    },{
      'name': '1 HOUR',
    },{
      'name': '3 HOUR',
    },
  ];

  // declaration


  int select = 0;
  bool tap = false;

   TimerController? _timerController;
  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  // Create a global key for the scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // A variable to track whether the bottom sheet is open or not
  bool _isBottomSheetOpen = false;

  // Method to toggle the bottom sheet
  void _toggleBottomSheet() {
    setState(() {
      _isBottomSheetOpen = !_isBottomSheetOpen;
    });
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
                backgroundColor: ColorUtils.checkEmailContainerBg,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.h,),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Show Pin",
                        style: TextStyle(
                          fontSize: 2.5.t,
                          fontWeight: FontWeight.bold,
                          color: ColorUtils.onboardHeading,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    Container(
                      height: 30.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: 4.w
                      ),
                      decoration: BoxDecoration(
                        color: ColorUtils.customYellow,
                        borderRadius: BorderRadius.circular(1.w)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h,),
                          Text("Home",
                            style: TextStyle(
                              fontSize: 2.5.t,
                              fontWeight: FontWeight.bold,
                              color: ColorUtils.blackColor,
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Container(
                            height: 15.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorUtils.onboardHeading
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Text("January 27, 2021 - 3:45 PM",
                            style: TextStyle(
                              fontSize: 2.t,
                              fontWeight: FontWeight.bold,
                              color: ColorUtils.blackColor,
                            ),
                          ),
                          SizedBox(height: 0.5.h,),
                          Text("Home Address",
                            style: TextStyle(
                              fontSize: 1.8.t,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 2.h,),
                    SlideCountdownSeparated(
                      height: 10.h,
                      width: 20.w,
                      textStyle: TextStyle(
                          color: ColorUtils.onboardHeading,
                          //fontFamily: poppinsMedium,
                          fontSize: 4.t
                      ),
                      padding: EdgeInsets.zero,
                      separatorPadding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Colors.transparent
                      ),

                      duration: const Duration(hours: 12),


                    ),
                    // Container(
                    //     child: SimpleTimer(
                    //       displayProgressIndicator: true,
                    //       timerStyle: TimerStyle.expanding_sector,
                    //       controller: _timerController,
                    //       duration: Duration(seconds: 10),
                    //     )
                    // ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w
                      ),
                      child: DecoratedCustomButton(
                        onTap: (){},
                        text: 'Back Home',
                        buttonColor: Colors.white,
                        borderColor: ColorUtils.onboardHeading,
                        textColor: ColorUtils.onboardHeading,

                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.w
                      ),
                      child: CustomButton(
                        onTap: _toggleBottomSheet,
                        text: 'SHOW PIN',
                        buttonColor: ColorUtils.onboardHeading,
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h,)
                  ],
                ),
                bottomSheet: _isBottomSheetOpen
                    ? Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.down,
                  onDismissed: (direction) {
                    setState(() {
                      _isBottomSheetOpen = false;
                    });
                  },
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.1,
                    minChildSize: 0.0,
                    maxChildSize: 0.7,
                    builder: (context, scrollController) {
                      return Container(
                        color: Colors.red, // Background color of the bottom sheet
                        child: ListView(
                          controller: scrollController,
                          children: <Widget>[
                            ListTile(title: Text('Item 1')),
                            ListTile(title: Text('Item 2')),
                            ListTile(title: Text('Item 3')),
                            // Add more items as needed
                          ],
                        ),
                      );
                    },
                  ),
                )
                    : null,
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




