import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/src/home/widgets/categories_list.dart';
import 'package:test1/src/home/widgets/custom_app_bar.dart';
import 'package:test1/src/home/widgets/home_header.dart';
import 'package:test1/src/home/widgets/home_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: CustomAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          children: [
            SizedBox(
              height: 20.h,
            ),
            const HomeSlider(),
            SizedBox(
              height: 15.h,
            ),
            const HomeHeader(),
            SizedBox(
              height: 15.h,
            ),
            const HomeCategoriesList()
          ],
        ));
  }
}
