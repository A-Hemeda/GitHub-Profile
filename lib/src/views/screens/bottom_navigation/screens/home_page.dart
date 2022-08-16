import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:interior_design_app/src/utils/constants.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';
import 'package:interior_design_app/src/views/components/categories_component.dart';
import 'package:interior_design_app/src/views/components/offer_item_widget.dart';
import 'package:interior_design_app/src/views/components/service_item_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('interior design'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:
      Column(
        children: [
          CategoriesListWidget(
            onChange: (selectedStatus){
              // refresh();
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child:
            Container(
              color: Colors.grey[100],
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Different Services',style: TextStyle(
                            fontSize: 14.sp,fontWeight: FontWeight.bold
                          ),),
                          Text('see all',style: TextStyle(
                              fontSize: 10.sp,
                          ),),

                        ],
                      ),
                    ),
                  ),
              SliverList(
                delegate:
                SliverChildBuilderDelegate(

                    (index,context)=>ServiceItemWidget(),
                  childCount: 3,

              ),
)   ,
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Offers & Packages',style: TextStyle(
                              fontSize: 14.sp,fontWeight: FontWeight.bold
                          ),),
                          Text('see all',style: TextStyle(
                            fontSize: 10.sp,
                          ),),

                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate:
                    SliverChildBuilderDelegate(

                          (index,context)=>const OfferItemWidget(),
                      childCount: 3,

                    ),
                  )   ,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




