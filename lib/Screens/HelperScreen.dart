import 'package:flutter/material.dart';

class Helper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'مساعدة',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  'يستخدم هذا التطبيق من أجل مساعدة الناس للتسبيح والتقرب من الله '),
            ],
          ),
        ),
      ),
    ));
  }
}
