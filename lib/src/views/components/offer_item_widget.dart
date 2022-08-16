import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:interior_design_app/src/utils/constants.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';

class OfferItemWidget extends StatelessWidget {
  const OfferItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset( '${Constants.ASSETS_IMAGES_PATH}interior.jpg',
              width: double.infinity,
              height: 130.h,
              fit: BoxFit.fill,
            ),

          ),
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Design of children'
                ,style: TextStyle(
                  fontSize: 14.sp,
                ),),
              Text('265 EG'
                ,style: TextStyle(
                    fontSize: 18.sp,
                    color: fSecondaryColor
                ),),

            ],
          ),




        ],
      ),
    );
  }
}