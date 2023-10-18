import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
import 'package:pinme/views/show%20pins/show_pins_.dart';
import 'package:pinme/widgets/custom_button.dart';
import 'package:pinme/widgets/custom_textfield.dart';
import 'package:pinme/widgets/decorated_custom_button.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../viewmodels/main_viewmodel.dart';

class AddNewPin2 extends StatefulWidget {
  const AddNewPin2({super.key});

  @override
  State<AddNewPin2> createState() => _AddNewPin2State();
}

class _AddNewPin2State extends State<AddNewPin2> {
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

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14
  );

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
                // context.unFocus();
                model.navigationService.navigateTo(to: ShowPin1());
              },
              child: Scaffold(
                backgroundColor: ColorUtils.checkEmailContainerBg,
                body: SingleChildScrollView(
                  //controller: ScrollController(),
                  physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 6.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w
                          ),
                          child: Row(
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
                        ),
                        SizedBox(height: 4.h,),
                        Container(
                          height: MediaQuery.of(context).size.height * 1,
                          color: ColorUtils.customYellow,
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.75,
                                decoration: BoxDecoration(
                                    //color: ColorUtils.onboardHeading,
                                    //borderRadius: BorderRadius.circular(4.w),

                                    // image: DecorationImage(image: AssetImage(
                                    //     ImageUtils.fullMap
                                    // ),
                                    //     fit: BoxFit.fill
                                    // )
                                ),
                                child: GoogleMap(
                                    initialCameraPosition: _kGooglePlex,
                                  onMapCreated: (GoogleMapController controller){
                                      _controller.complete(controller);
                                  },
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
                              )
                            ],
                          ),
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

}



