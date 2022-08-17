import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interior_design_app/src/models/bottom_navigator_item.dart';
import 'package:interior_design_app/src/utils/constants.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationPage extends StatefulWidget {
  final List<BottomNavigationItem> items;

  BottomNavigationPage({
    Key key,
    this.items,
  }) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  int selectedPage = 0;

  void onTap(int index) {
    if (selectedPage == index) return;
    setState(() {
      selectedPage = index;
      pageController.jumpToPage(selectedPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        elevation: 20,
        margin: EdgeInsets.zero,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          height: 60.h,
          child: Row(
            children: <Widget>[
              ...widget.items.map((e) => Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap(widget.items.indexOf(e));
                        if (e.onTap != null) e.onTap(widget.items.indexOf(e));
                      },
                      child: SizedBox(
                        child: Container(
                          key: e.key,
                          //_mainScreenNotifiers.keyBottomNavigationHome,
                          height: double.infinity,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                e.icon,
                                color: selectedPage == widget.items.indexOf(e)
                                    ? Theme.of(context).primaryColor
                                    : fIconColor,
                              ),
                              Text(
                                e.title,
                                style: TextStyle(
                                    color:
                                        selectedPage == widget.items.indexOf(e)
                                            ? Theme.of(context).primaryColor
                                            : fIconColor,
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          ...widget.items.map((e) => e.page),
        ],
      ),
    );
  }
}
