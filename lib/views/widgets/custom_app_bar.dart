
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_search_icon.dart';

class CustomNotesViewAppBar extends StatelessWidget {
   const CustomNotesViewAppBar({Key? key,this.appBarTitle,this.appBarIcon, this.onTap}) : super(key: key);
  final String? appBarTitle;
  final IconData? appBarIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 70,right: 24,left: 24),
      child: Row(
        children: [
          Text(
            appBarTitle!,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: CustomSearchIcon(
              appBarIcon: appBarIcon,
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

