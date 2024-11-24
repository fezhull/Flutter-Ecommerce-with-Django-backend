import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/common/utils/app_routes.dart';
import 'package:test1/common/utils/kcolors.dart';
import 'package:test1/common/utils/kstrings.dart';
import 'package:test1/common/widgets/app_style.dart';
import 'package:test1/common/widgets/reusable_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            text: AppText.kCategories,
            style: appStyle(13, Kolors.kDark, FontWeight.w600)),
        GestureDetector(
          onTap: () {
            context.push('/categories');
          },
          child: ReusableText(
              text: AppText.kViewAll,
              style: appStyle(13, Kolors.kGray, FontWeight.normal)),
        )
      ],
    );
  }
}