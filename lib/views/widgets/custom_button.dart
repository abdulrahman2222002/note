// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   CustomButton(this.title, this.onTap,this.buttonColor,this.titleColor, {super.key});
//   String? title;
//   VoidCallback onTap;
//   Color buttonColor;
//   Color titleColor;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16), color: buttonColor),
//             height: 65,
//             width: 344,
//             child: Center(
//               child: Text(
//                 title!,
//                 style:  TextStyle(
//                   color: titleColor,
//                   fontSize: 25,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class BuildButton extends StatelessWidget {
  BuildButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.buttonColor,
    required this.titleColor,
    this.height,
    this.width,
    required this.isLoading,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  Color buttonColor;
  Color titleColor;
  double? height;
  double? width;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                : Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      color: titleColor,
                    ),
                  )),
      ),
    );
  }
}
