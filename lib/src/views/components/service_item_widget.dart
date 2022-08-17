import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:interior_design_app/src/utils/constants.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';
import 'package:interior_design_app/src/views/components/custom_btn_component.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              '${Constants.ASSETS_IMAGES_PATH}interior.jpg',
              width: 120.w,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Design of children's",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'room for 2 children',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        'interior Design',
                        style: TextStyle(fontSize: 10.sp, color: fTextColor),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '256 EG',
                      style: TextStyle(fontSize: 18.sp, color: fSecondaryColor),
                    ),
                    RatingBarIndicator(
                      rating: 3,
                      itemBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      itemCount: 4,
                      itemSize: 17.0.w,
                      direction: Axis.horizontal,
                    ),
                    CustomBtnComponent(
                      title: 'BOOK',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
