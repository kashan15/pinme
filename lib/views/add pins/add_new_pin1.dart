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
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';

class AddNewPin1 extends StatefulWidget {
  const AddNewPin1({super.key});

  @override
  State<AddNewPin1> createState() => _AddNewPin1State();
}

class _AddNewPin1State extends State<AddNewPin1> {
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

  int select = 0;
  bool tap = false;

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
                body: SingleChildScrollView(
                  //controller: ScrollController(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.w
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 3.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.arrow_back_rounded,
                                color: Colors.red,
                              ),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("ADD NEW PIN ",
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

                          SizedBox(height: 3.h,),
                          Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                                color: ColorUtils.customYellow,
                                borderRadius: BorderRadius.circular(
                                    1.w
                                )
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 26.h,
                                  decoration: BoxDecoration(
                                      color: ColorUtils.onboardHeading,
                                      borderRadius: BorderRadius.circular(
                                          1.w
                                      )
                                  ),
                                ),
                                SizedBox(height: 3.5.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
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


                              ],
                            ),
                          ),

                          SizedBox(height: 5.h,),



                          CustomTextField1(
                            controller: model.nameController,
                            hintText: 'Name',
                            hintColor: ColorUtils.onboardHeading,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorUtils.onboardHeading), // Color of the line when focused
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey), // Color of the line when not focused
                            ),
                            //contentPadding: EdgeInsets.only(bottom: 2.25.h),
                            prefixIcon: Icon(Icons.person, color: ColorUtils.onboardHeading,),
                            //suffixIcon: Icon(Icons.person),
                          ),

                          SizedBox(height: 4.h,),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("LOCATION TYPE",
                              style: TextStyle(
                                //fontFamily: FontUtils.avertaSemiBold,
                                fontSize: 1.8.t,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.onboardHeading,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.25.h,),
                          Container(
                            height: 6.h,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              // itemExtent: 35.w,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        model.locationTap = index;
                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        // padding: EdgeInsets.symmetric(
                                        //     horizontal: 8.5.w
                                        // ),
                                        width: 28.w,
                                        decoration: BoxDecoration(
                                          color: model.locationTap == index ?
                                          ColorUtils.onboardHeading : ColorUtils.whiteColor,
                                          borderRadius: BorderRadius.circular(1.w),
                                        ),
                                        child: Center(
                                          child: Text(
                                            optionsList1[index]['name'],
                                            style: TextStyle(
                                              //fontFamily: FontUtils.avertaSemiBold,
                                              fontSize: 1.8.t,
                                              fontWeight: FontWeight.bold,
                                              color: model.locationTap == index ?
                                              ColorUtils.whiteColor : ColorUtils.onboardHeading,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w,)
                                  ],
                                );
                              },

                            ),
                          ),

                          SizedBox(height: 3.h,),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("share for",
                              style: TextStyle(
                                //fontFamily: FontUtils.avertaSemiBold,
                                fontSize: 1.8.t,
                                fontWeight: FontWeight.bold,
                                color: ColorUtils.onboardHeading,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.25.h,),
                          Container(
                            height: 6.h,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              // itemExtent: 35.w,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        model.shareTap = index;
                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        // padding: EdgeInsets.symmetric(
                                        //     horizontal: 8.5.w
                                        // ),
                                        width: 28.w,
                                        decoration: BoxDecoration(
                                          color: model.shareTap == index ?
                                          ColorUtils.onboardHeading : ColorUtils.whiteColor,
                                          borderRadius: BorderRadius.circular(1.w),
                                        ),
                                        child: Center(
                                          child: Text(
                                            optionsList2[index]['name'],
                                            style: TextStyle(
                                              //fontFamily: FontUtils.avertaSemiBold,
                                              fontSize: 1.8.t,
                                              fontWeight: FontWeight.bold,
                                              color: model.shareTap == index ?
                                              ColorUtils.whiteColor : ColorUtils.onboardHeading,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w,)
                                  ],
                                );
                              },

                            ),
                          ),


                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     CustomTextField1(
                          //       controller: model.nameController,
                          //       focusedBorder: UnderlineInputBorder(
                          //         borderSide: BorderSide(color: ColorUtils.onboardHeading), // Color of the line when focused
                          //       ),
                          //       enabledBorder: const UnderlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.grey), // Color of the line when not focused
                          //       ),
                          //       //contentPadding: EdgeInsets.only(bottom: 2.25.h),
                          //       prefixIcon: Icon(Icons.person),
                          //       //suffixIcon: Icon(Icons.person),
                          //     ),
                          //     Expanded(
                          //       child: CustomTextField1(
                          //         controller: model.nameController,
                          //         focusedBorder: UnderlineInputBorder(
                          //           borderSide: BorderSide(color: ColorUtils.onboardHeading), // Color of the line when focused
                          //         ),
                          //         enabledBorder: const UnderlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.grey), // Color of the line when not focused
                          //         ),
                          //         //contentPadding: EdgeInsets.only(bottom: 2.25.h),
                          //         prefixIcon: Icon(Icons.person),
                          //         //suffixIcon: Icon(Icons.person),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          SizedBox(height: 5.h,),

                          DecoratedCustomButton(
                            onTap: (){},
                            text: 'cancel',
                            buttonColor: Colors.white,
                            borderColor: ColorUtils.onboardHeading,
                            textColor: ColorUtils.onboardHeading,

                          ),
                          SizedBox(height: 2.5.h,),
                          CustomButton(
                            onTap: (){

                            },
                            text: 'SAVE',
                            buttonColor: ColorUtils.onboardHeading,
                            textColor: Colors.white,
                          ),


                        ],
                      ),
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



