// import 'package:flutter/material.dart';
//
// class CustomTextField1 extends StatefulWidget {
//   final String labelText;
//   final String hintText;
//
//   CustomTextField1({required this.labelText, required this.hintText});
//
//   @override
//   _CustomTextField1State createState() => _CustomTextField1State();
// }
//
// class _CustomTextField1State extends State<CustomTextField1> {
//   TextEditingController _controller = TextEditingController();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextForm(
//       controller: _controller,
//       decoration: InputDecoration(
//         labelText: widget.labelText,
//         hintText: widget.hintText,
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         }
//         return null;
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  String? labelText;
  String? hintText;
  double? hintFontSize;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  double? fontSize;
  final dynamic fontFamily;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final Color? textColor;
  final Color? hintColor;
  final Color? cursorColor;
  TextInputType? inputType;
  String? Function(String?)? validation;
  final bool obscureText;
  InputBorder? focusedBorder;
  InputBorder? enabledBorder;


  CustomTextField1({
    this.labelText,
    this.hintText,
    this.hintFontSize,
    this.fontSize,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    this.onChanged,
    this.contentPadding,
    this.fontFamily,
    this.textColor,
    this.hintColor,
    this.cursorColor,
    this.inputType,
    this.validation,
    this.obscureText = false,
    this.focusedBorder,
    this.enabledBorder
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      keyboardType: inputType,
      cursorColor: cursorColor,
      obscureText: obscureText,
      autofocus: false,
      decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          //isDense: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: hintColor,
              fontSize: hintFontSize,
              fontFamily: fontFamily,
              textBaseline: TextBaseline.alphabetic,
              overflow: TextOverflow.ellipsis,
              decoration: TextDecoration.none
          ),
          alignLabelWithHint: true,
          contentPadding: contentPadding,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
              minWidth: 30.0
          ),
          prefix: prefixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: 20
        )
      ),
      textAlignVertical: TextAlignVertical.top,
      
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          color: textColor,
          textBaseline: TextBaseline.alphabetic,
          overflow: TextOverflow.ellipsis,
          decoration: TextDecoration.none
      ),
      onChanged: onChanged,

    );
  }
}
