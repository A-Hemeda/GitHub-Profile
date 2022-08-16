
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';

class CategoriesListWidget extends StatefulWidget {
  final Function(int id) onChange;
  const CategoriesListWidget({
    Key key,
    this.onChange,
  }) : super(key: key);

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  int selectedCategoryId=-1;
  List<String>categories=['Design of children room','living room design','living room design'];
  @override
  Widget build(BuildContext context) {
    return

      Container(
        height: 55.h,
        padding: EdgeInsetsDirectional.only(start: 10.w,top: 10,bottom: 10),
        alignment: AlignmentDirectional.topStart,
        decoration: BoxDecoration(
            color: Colors.white,

        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // CategoryButton(
            //   title: 'All'.tr(),
            //   isSelected: selectedCategoryId==-1 ,
            //   onTap: (){
            //     if( selectedCategoryId==-1)return;
            //     setState(() {
            //       selectedCategoryId=-1;
            //     });
            //   },
            // ),

            ...categories.map((e) {

              return Column(
                children: [
                  CategoryButton(
                    title:e,
                    isSelected:  selectedCategoryId==categories.indexOf(e)-1,
                    onTap: (){
                      if( selectedCategoryId==categories.indexOf(e)-1)return;
                      setState(() {
                        selectedCategoryId=categories.indexOf(e)-1;
                      });
                      widget.onChange(selectedCategoryId);
                    },

                  ),
                ],
              );
            }).toList(),



          ],
        ),



      );

  }
}

class CategoryButton extends StatefulWidget {
  final bool isSelected;
  final Function onTap;
  final String title;
  const CategoryButton({
    Key key,
    @required this.isSelected,
    @required this.onTap,
    @required this.title,

  }) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 5, horizontal: 15),
        margin: const EdgeInsets.symmetric(
            vertical: 4, horizontal: 5),
        decoration: BoxDecoration(
          color:
          widget.isSelected
              ? fCategoryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow:  widget.isSelected
          ?[
            BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black12,
                blurRadius: 2
            )
          ]: null
        ),
        child: Center(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline2.copyWith(
                color:
                widget.isSelected
                    ? Colors.white
                    : Colors.grey,

                fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
