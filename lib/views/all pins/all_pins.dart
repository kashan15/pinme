import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

class AllPins extends StatefulWidget {
  const AllPins({super.key});

  @override
  State<AllPins> createState() => _AllPinsState();
}

class _AllPinsState extends State<AllPins> {

  List slideList = [
    {
      'color': Colors.pinkAccent,
      'boxText': 'Ah',
      'name': 'Ahmed Pins'
    },
    {
      'color': Colors.blue,
      'boxText': 'Fr',
      'name': 'Friends Pins'
    },
    {
      'color': Colors.purple,
      'boxText': 'Me',
      'name': 'Meets Pins'
    },
    {
      'color': Colors.grey,
      'boxText': 'Ot',
      'name': 'Others Pins'
    },
    {
      'color': Colors.orangeAccent,
      'boxText': 'Ah',
      'name': 'Ahmed Pins'
    },
    {
      'color': Colors.pinkAccent,
      'boxText': 'Ah',
      'name': 'Ahmed Pins'
    },
    {
      'color': Colors.blue,
      'boxText': 'Fr',
      'name': 'Friends Pins'
    },
    {
      'color': Colors.purple,
      'boxText': 'Me',
      'name': 'Meets Pins'
    },
    {
      'color': Colors.grey,
      'boxText': 'Ot',
      'name': 'Others Pins'
    },
    {
      'color': Colors.orangeAccent,
      'boxText': 'Ah',
      'name': 'Ahmed Pins'
    },

  ];

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
                backgroundColor: ColorUtils.chatBackground,
                body: SingleChildScrollView(
                  //controller: ScrollController(),
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 3.h,),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.power_settings_new_rounded,
                              color: ColorUtils.onboardHeading,
                            ),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("ALL PINS",
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
                        margin: EdgeInsets.symmetric(
                          horizontal: 4.w
                        ),
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.w)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 0.w
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w
                                  ),
                                  child: TextFormField(
                                    cursorColor: ColorUtils.onboardHeading,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search here',
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 2.t,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 2.t,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 8.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(6.w)
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.search,
                                    size: 4.h,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 6.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text("LAST 7 DAYS",
                            style: TextStyle(
                              //fontFamily: FontUtils.avertaSemiBold,
                              fontSize: 2.3.t,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 8,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Slidable(
                                    direction: Axis.horizontal,
                                    key:  ValueKey(1),
                                    useTextDirection: true,
                                    closeOnScroll: true,
                                    // The end action pane is the one at the right or the bottom side.
                                    endActionPane:  ActionPane(
                                      motion: const ScrollMotion(),
                                      extentRatio: 0.4,
                                      dragDismissible: true,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                            //height: 7.h,
                                            width: 15.w,
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              shape: BoxShape.circle
                                            ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 3.h,
                                                  color: Colors.white,
                                                ),
                                              ),
                                          ),
                                            SizedBox(width: 6.w,),
                                            Container(
                                              //height: 7.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.delete_outlined,
                                                  size: 3.h,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                       ] )

                                      ],
                                    ),
                                    child: Container(
                                      height: 12.5.h,
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4.w
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 2.5.h
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5.w)
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: double.infinity,
                                            width: 16.w,
                                            decoration: BoxDecoration(
                                              color: slideList[index]['color'],
                                              borderRadius: BorderRadius.circular(3.5.w)
                                            ),
                                            child: Center(
                                              child: Text(slideList[index]['boxText'],
                                                style: TextStyle(
                                                  //fontFamily: FontUtils.avertaSemiBold,
                                                  fontSize: 2.8.t,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorUtils.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w,),
                                          Text(slideList[index]['name'],
                                            style: TextStyle(
                                              //fontFamily: FontUtils.avertaSemiBold,
                                              fontSize: 2.8.t,
                                              fontWeight: FontWeight.bold,
                                              color: ColorUtils.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                ],
                              );
                            },
                        ),
                      ),

                      SizedBox(height: 20.h,),



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


class TestClass extends StatefulWidget {
  const TestClass({super.key});

  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.yellow,
            child: Slidable(
              // Specify a key if the Slidable is dismissible.
                key: const ValueKey(0),

                // The start action pane is the one at the left or the top side.
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),

                  // A pane can dismiss the Slidable.
                  dismissible: DismissiblePane(onDismissed: () {}),

                  // All actions are defined in the children parameter.
                  children: const [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.share,
                      label: 'Share',
                    ),
                  ],
                ),

                // The end action pane is the one at the right or the bottom side.
                endActionPane: const ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 2,
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archive',
                    ),
                    SlidableAction(
                      onPressed: doNothing,
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.save,
                      label: 'Save',
                    ),
                  ],
                ),

                // The child of the Slidable is what the user sees when the
                // component is not dragged.
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Slide me...')
                  ],
                )
            ),
          ),
          Slidable(
            // Specify a key if the Slidable is dismissible.
            key: const ValueKey(1),

            // The start action pane is the one at the left or the top side.
            startActionPane: const ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: ScrollMotion(),

              // All actions are defined in the children parameter.
              children: [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: const [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Archive',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Save',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: const ListTile(title: Text('Slide me')),
          ),
        ],
      ),
    );
  }
}

void doNothing(BuildContext context) {}




