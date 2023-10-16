import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:pinme/utils/color_utils.dart';
import 'package:pinme/utils/extensions.dart';
import 'package:pinme/utils/image_utils.dart';
import 'package:pinme/views/authentication/login/login_screen.dart';
import 'package:stacked/stacked.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [

    /// First Page
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                SizedBox(height: 18.h,),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 40.h,
                      child: Image.asset(ImageUtils.onboarding1)),
                ),
                SizedBox(height: 4.h,),
                Align(
                  alignment: Alignment.center,
                  child: Text("With Pin Me drop a pin on\nyour exact location",
                  style: TextStyle(
                    color: ColorUtils.onboardHeading,
                    fontWeight: FontWeight.bold,
                    fontSize: 3.4.t
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.5.h,),
                Align(
                  alignment: Alignment.center,
                  child: Text("Pin me will generate permanent pin-codes\nfor that location. Your pin code then is\nsaved and can be shared.",
                    style: TextStyle(
                        color: ColorUtils.onboardText,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.1.t,
                      height: 0.175.h
                    ),
                    textAlign: TextAlign.center,


                  ),
                )
              ],
            ),
          ),
        )
      ),
    ),

    /// Second Page
    PageModel(
      widget: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  SizedBox(height: 18.h,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 40.h,
                        child: Image.asset(ImageUtils.onboarding2)),
                  ),
                  SizedBox(height: 4.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Text("With Pin Me Add views and\nphotos",
                      style: TextStyle(
                          color: ColorUtils.onboardHeading,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.4.t
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Text("get to your destination faster and easier\nby uploading photos to identify your\nhouse, building, gate, etc.",
                      style: TextStyle(
                          color: ColorUtils.onboardText,
                          fontWeight: FontWeight.bold,
                          fontSize: 2.1.t,
                          height: 0.175.h
                      ),
                      textAlign: TextAlign.center,


                    ),
                  )
                ],
              ),
            ),
          )
      ),
    ),

    /// Third Page
    PageModel(
      widget: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 0.0,
              color: Colors.white,
            ),
          ),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  SizedBox(height: 18.h,),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 40.h,
                        child: Image.asset(ImageUtils.onboarding3)),
                  ),
                  SizedBox(height: 4.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Share with friends",
                      style: TextStyle(
                          color: ColorUtils.onboardHeading,
                          fontWeight: FontWeight.bold,
                          fontSize: 3.4.t
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Text("you can share your pin for transportation\nfriends and for your shipment orders ",
                      style: TextStyle(
                          color: ColorUtils.onboardText,
                          fontWeight: FontWeight.bold,
                          fontSize: 2.1.t,
                          height: 0.175.h
                      ),
                      textAlign: TextAlign.center,


                    ),
                  )
                ],
              ),
            ),
          )
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          // if (setIndex != null) {
          //   index = 2;
          //   setIndex(2);
          // }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            // style: defaultSkipButtonTextStyle,
            style: TextStyle(
              color: ColorUtils.onboardHeading,
              fontSize: 1.6.t,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child:Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Lets Go',
            style: TextStyle(
                color: ColorUtils.onboardHeading,
                fontSize: 1.6.t,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(
                  width: 0.0,
                  color: Colors.white,
                ),
              ),
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  // padding: const EdgeInsets.all(45.0),
                  padding: EdgeInsets.only(
                      left: 12.w,
                      right: 4.w,
                      bottom: 7.h
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          //indicatorDesign: 
                          // IndicatorDesign.line(
                          //   lineDesign: LineDesign(
                          //     lineType: DesignType.line_uniform,
                          //   ),
                          // ),
                          indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                  polygon: DesignType.polygon_circle,
                                polygonRadius: 1.25.w,
                              ),
                          ),
                          activeIndicator: const ActiveIndicator(
                            color: Colors.grey
                          ),
                          closedIndicator: ClosedIndicator(
                            color: ColorUtils.onboardHeading
                          )
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}