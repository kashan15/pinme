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
import 'package:pinme/widgets/custom_navbar.dart';
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

  List ridersList = [
    {
      'image': ImageUtils.gridPic1
    },
    {
      'image': ImageUtils.gridPic2
    },
    {
      'image': ImageUtils.gridPic3
    },
    {
      'image': ImageUtils.gridPic4
    },
  ];

  // declaration


  int select = 0;

  bool tap = false;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  // TextEditingController textEditingController = TextEditingController();

  TextEditingController fieldController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController1;
  @override

  void initState() {
    errorController1 = StreamController<ErrorAnimationType>();
    super.initState();
  }

  // @override
  // void dispose() {
  //   //errorController!.close();
  //   super.dispose();
  // }

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
        // model.gridSelection = 0;
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
                              color: ColorUtils.onboardHeading,
                                image: DecorationImage(image: AssetImage(
                                    ImageUtils.showPinMap
                                ),
                                    fit: BoxFit.contain
                                )
                            ),
                            // child: Column(
                            //   children: [
                            //     SizedBox(height: 2.h,),
                            //     Text("497 Evergreen Rd.",
                            //       style: TextStyle(
                            //         fontSize: 2.t,
                            //         fontWeight: FontWeight.bold,
                            //         color: ColorUtils.whiteColor,
                            //       ),
                            //     ),
                            //     SizedBox(height: 1.h,),
                            //     Text("Roseville CA, 95673",
                            //       style: TextStyle(
                            //         fontSize: 2.t,
                            //         fontWeight: FontWeight.bold,
                            //         color: ColorUtils.whiteColor,
                            //       ),
                            //     ),
                            //     Icon(Icons.location_on,
                            //     color: Colors.white,
                            //       size: 3.5.h,
                            //     ),
                            //   ],
                            // ),
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
                        onTap: (){
                          model.navigationService.navigateTo(to: BottomNavBar());
                        },
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
                        // onTap: _toggleBottomSheet,
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8.w)
                                  )
                              ),
                              builder: (BuildContext context){
                                return customModalSheet();
                              }
                          );
                        },
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

  Widget customModalSheet(){
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model){
        // model.gridSelection = 0;
      },
      builder: (context, model, child) {
        return SizedBox(
          height: 48.h,
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 6.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PIN number",
                      style: TextStyle(
                        fontSize: 2.t,
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.onboardHeading,
                      ),
                    ),
                    Material(
                      child: InkWell(
                        onTap: (){},
                        child: SizedBox(
                          height: 3.5.h,
                          child: Image.asset(
                            ImageUtils.clipIcon
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 2.5.h,),

              // Form(
              //   key: formKey,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 6.w,
              //     ),
              //     child: PinCodeTextField(
              //       appContext: context,
              //       backgroundColor: Colors.white,
              //
              //       pastedTextStyle: TextStyle(
              //         color: Colors.green.shade600,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       enablePinAutofill: true,
              //       length: 6,
              //       obscureText: true,
              //       obscuringCharacter: '*',
              //       blinkWhenObscuring: true,
              //       animationType: AnimationType.fade,
              //       validator: (v) {
              //         if (v!.length < 3) {
              //           return "I'm from validator";
              //         } else {
              //           return null;
              //         }
              //       },
              //       pinTheme: PinTheme(
              //         shape: PinCodeFieldShape.box,
              //         borderRadius: BorderRadius.circular(5),
              //         fieldHeight: 65,
              //         fieldWidth: 45,
              //         activeFillColor: Colors.white,
              //       ),
              //       cursorColor: Colors.black,
              //       animationDuration: const Duration(milliseconds: 300),
              //       enableActiveFill: true,
              //       errorAnimationController: errorController1,
              //       controller: fieldController,
              //       keyboardType: TextInputType.number,
              //       boxShadows: const [
              //         BoxShadow(
              //           offset: Offset(0, 1),
              //           color: Colors.black12,
              //           blurRadius: 10,
              //         )
              //       ],
              //       onCompleted: (v) {
              //         debugPrint("Completed");
              //       },
              //       // onTap: () {
              //       //   print("Pressed");
              //       // },
              //       onChanged: (value) {
              //         debugPrint(value);
              //         setState(() {
              //           currentText = value;
              //         });
              //       },
              //       beforeTextPaste: (text) {
              //         debugPrint("Allowing to paste $text");
              //         //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //         //but you can show anything you want here, like your pop up saying wrong paste format or etc
              //         return true;
              //       },
              //     ),
              //   ),
              // ),
              //
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
              //   child: Text(
              //     hasError ? "*Please fill up all the cells properly" : "",
              //     style: const TextStyle(
              //       color: Colors.red,
              //       fontSize: 12,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),

              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 6.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SHARE WITH",
                      style: TextStyle(
                        fontSize: 2.t,
                        fontWeight: FontWeight.bold,
                        color: ColorUtils.onboardHeading,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          model.navigationService.navigateTo(to: SeeAllScreen());
                        },
                        child: Text("SEE ALL",
                          style: TextStyle(
                            fontSize: 2.t,
                            fontWeight: FontWeight.bold,
                            color: ColorUtils.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 1.h,),

              SizedBox(
                height: 10.h,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(
                      left: 6.w
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            model.gridSelection = index;
                            model.notifyListeners();
                          },
                          child: Container(
                            height: 10.h,
                            width: 20.5.w,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(2.w),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 3)
                                  ),

                                ],
                                image: DecorationImage(image: AssetImage(
                                    ridersList[index]['image']
                                ),
                                    fit: BoxFit.cover
                                )
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 0.5.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w
                                  ),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        height: 1.75.h,
                                        child:
                                        model.gridSelection == index ?
                                        Image.asset(
                                          ImageUtils.check,
                                        ) :
                                        Image.asset(
                                          ImageUtils.check,
                                          color: Colors.transparent,
                                        )
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 2.w,)
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 7.h,),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 6.w
                ),
                child: CustomButton(
                  onTap: (){},
                  text: 'CLOSE',
                  buttonColor: ColorUtils.onboardHeading,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
    
  }
}



class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {

  List ridersList = [
    {
      'image': ImageUtils.gridPic1
    },
    {
      'image': ImageUtils.gridPic2
    },
    {
      'image': ImageUtils.gridPic3
    },
    {
      'image': ImageUtils.gridPic4
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model){
        // model.gridSelection = 0;
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
                body: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: ColorUtils.chatBackground,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 6.h,),
                          Text("PIN number",
                            style: TextStyle(
                              fontSize: 2.5.t,
                              fontWeight: FontWeight.bold,
                              color: ColorUtils.onboardHeading,
                            ),
                          ),
                          SizedBox(height: 4.h,),
                          Container(
                            height: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.w),
                                topRight: Radius.circular(12.w)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 3)
                                )
                              ]
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 2.5.h,),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: (){
                                        model.navigationService.back();
                                      },
                                      child: Container(
                                        height: 4.h,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4.w
                                        ),
                                        child: Image.asset(
                                          ImageUtils.crossIcon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("PIN number",
                                        style: TextStyle(
                                          fontSize: 2.t,
                                          fontWeight: FontWeight.bold,
                                          color: ColorUtils.onboardHeading,
                                        ),
                                      ),
                                      Material(
                                        child: InkWell(
                                          onTap: (){},
                                          child: SizedBox(
                                            height: 3.5.h,
                                            child: Image.asset(
                                                ImageUtils.clipIcon,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(height: 2.5.h,),

                                // Form(
                                //   key: formKey,
                                //   child: Padding(
                                //     padding: EdgeInsets.symmetric(
                                //       horizontal: 6.w,
                                //     ),
                                //     child: PinCodeTextField(
                                //       appContext: context,
                                //       backgroundColor: Colors.white,
                                //
                                //       pastedTextStyle: TextStyle(
                                //         color: Colors.green.shade600,
                                //         fontWeight: FontWeight.bold,
                                //       ),
                                //       enablePinAutofill: true,
                                //       length: 6,
                                //       obscureText: true,
                                //       obscuringCharacter: '*',
                                //       blinkWhenObscuring: true,
                                //       animationType: AnimationType.fade,
                                //       validator: (v) {
                                //         if (v!.length < 3) {
                                //           return "I'm from validator";
                                //         } else {
                                //           return null;
                                //         }
                                //       },
                                //       pinTheme: PinTheme(
                                //         shape: PinCodeFieldShape.box,
                                //         borderRadius: BorderRadius.circular(5),
                                //         fieldHeight: 65,
                                //         fieldWidth: 45,
                                //         activeFillColor: Colors.white,
                                //       ),
                                //       cursorColor: Colors.black,
                                //       animationDuration: const Duration(milliseconds: 300),
                                //       enableActiveFill: true,
                                //       errorAnimationController: errorController1,
                                //       controller: fieldController,
                                //       keyboardType: TextInputType.number,
                                //       boxShadows: const [
                                //         BoxShadow(
                                //           offset: Offset(0, 1),
                                //           color: Colors.black12,
                                //           blurRadius: 10,
                                //         )
                                //       ],
                                //       onCompleted: (v) {
                                //         debugPrint("Completed");
                                //       },
                                //       // onTap: () {
                                //       //   print("Pressed");
                                //       // },
                                //       onChanged: (value) {
                                //         debugPrint(value);
                                //         setState(() {
                                //           currentText = value;
                                //         });
                                //       },
                                //       beforeTextPaste: (text) {
                                //         debugPrint("Allowing to paste $text");
                                //         //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //         //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                //         return true;
                                //       },
                                //     ),
                                //   ),
                                // ),
                                //
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                //   child: Text(
                                //     hasError ? "*Please fill up all the cells properly" : "",
                                //     style: const TextStyle(
                                //       color: Colors.red,
                                //       fontSize: 12,
                                //       fontWeight: FontWeight.w400,
                                //     ),
                                //   ),
                                // ),

                                SizedBox(height: 10.h,),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("SHARE WITH",
                                        style: TextStyle(
                                          fontSize: 2.t,
                                          fontWeight: FontWeight.bold,
                                          color: ColorUtils.onboardHeading,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                SizedBox(height: 1.h,),

                                SizedBox(
                                  height: 10.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.only(
                                        left: 6.w
                                    ),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              model.gridSelection = index;
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              height: 10.h,
                                              width: 20.5.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(2.w),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.withOpacity(0.3),
                                                        spreadRadius: 1,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 3)
                                                    ),

                                                  ],
                                                  image: DecorationImage(image: AssetImage(
                                                      ridersList[index]['image']
                                                  ),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 0.5.h,),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 2.w
                                                    ),
                                                    child: Align(
                                                        alignment: Alignment.topRight,
                                                        child: SizedBox(
                                                            height: 1.75.h,
                                                            child:
                                                            model.gridSelection == index ?
                                                            Image.asset(
                                                              ImageUtils.check,
                                                            ) :
                                                            Image.asset(
                                                              ImageUtils.check,
                                                              color: Colors.transparent,
                                                            )
                                                        )
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 2.w,)
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 2.h,),
                                SizedBox(
                                  height: 10.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.only(
                                        left: 6.w
                                    ),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              model.gridSelection = index;
                                              model.notifyListeners();
                                            },
                                            child: Container(
                                              height: 10.h,
                                              width: 20.5.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(2.w),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey.withOpacity(0.3),
                                                        spreadRadius: 1,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 3)
                                                    ),

                                                  ],
                                                  image: DecorationImage(image: AssetImage(
                                                      ridersList[index]['image']
                                                  ),
                                                      fit: BoxFit.cover
                                                  )
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 0.5.h,),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 2.w
                                                    ),
                                                    child: Align(
                                                        alignment: Alignment.topRight,
                                                        child: SizedBox(
                                                            height: 1.75.h,
                                                            child:
                                                            model.gridSelection == index ?
                                                            Image.asset(
                                                              ImageUtils.check,
                                                            ) :
                                                            Image.asset(
                                                              ImageUtils.check,
                                                              color: Colors.transparent,
                                                            )
                                                        )
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 2.w,)
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(height: 25.h,),


                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w
                                  ),
                                  child: CustomButton(
                                    onTap: (){},
                                    text: 'CLOSE',
                                    buttonColor: ColorUtils.onboardHeading,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                ]),
                    ),
              ),
          ),
        ));
      },
    );
  }
}





