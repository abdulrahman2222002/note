// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../constants/constants.dart';

// class CustomTextFormField extends StatelessWidget {
//   CustomTextFormField(this.label, this.hintText, this.onChanged, this.type,
//       {super.key});
//   String? label;
//   String? hintText;
//   Function(String)? onChanged;
//   @required
//   TextInputType type;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 244,
//       width: 50,
//       child: TextFormField(
//         cursorColor: blueColor,
//         validator: (data) {
//           if (data!.isEmpty) {
//             return 'field is required';
//           }
//           return null;
//         },
//         style: const TextStyle(color: blueColor),
//         onChanged: onChanged,
//         keyboardType: type,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.email_outlined,
//             color: blueColor,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(
//               color: maxGrayColor,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(
//               color: blueColor,
//             ),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(
//               color: blueColor,
//             ),
//           ),
//           labelText: label,
//           labelStyle: const TextStyle(color: blueColor),
//           hintText: hintText,
//           hintStyle: const TextStyle(color: blueColor),
//         ),
//       ),
//     );
//   }
// }

class BuildTextFeild extends StatelessWidget {
  BuildTextFeild({Key? key,
    this.hintText,
    this.maxLines,
    this.onSaved,
    this.onChanged,

  }) : super(key: key);
  final String? hintText;
  int? maxLines =1;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      width: double.infinity,
      child: TextFormField(
        maxLines: maxLines,
        cursorColor:kPrimaryColor,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: (value){
          if(value?.isEmpty ?? true ){
            return "feild is empty";
          }else{
            return null;
          }
        },
        style: const TextStyle(
          color: whitColor,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          border: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(kPrimaryColor),
          disabledBorder: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: whitColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([color]) {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(
            color:color?? whitColor,
            width: 1.5,
          ),
        );
  }
}
