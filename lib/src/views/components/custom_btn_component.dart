import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';

class CustomBtnComponent extends StatelessWidget {
  final String title;
  final Function onTap;

  const CustomBtnComponent({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: fSecondaryColor, borderRadius: BorderRadius.circular(5)),
        child: Text(
          title ?? '',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
