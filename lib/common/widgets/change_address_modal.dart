import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common/utils/kcolors.dart';
import 'package:test1/common/utils/kstrings.dart';
import 'package:test1/common/widgets/app_style.dart';
import 'package:test1/common/widgets/reusable_text.dart';
import 'package:test1/const/constants.dart';

Future<dynamic> changeAddressBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: ScreenUtil().screenHeight,
        decoration: BoxDecoration(borderRadius: kRadiusTop),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            Center(
                child: ReusableText(
                    text: AppText.kCheckoutAddress,
                    style: appStyle(16, Kolors.kPrimary, FontWeight.w500))),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              color: Kolors.kGrayLight,
              thickness: 0.5.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            ReusableText(
                text: AppText.kCheckoutAddressText,
                style: appStyle(13, Kolors.kGray, FontWeight.w500)),
            SizedBox(
              height: 10.h,
            ),

            ///TODO:
            // SizedBox(
            //   height: ScreenUtil().screenHeight*0.6,
            //   child: const CheckoutAddressSelection())
          ],
        ),
      );
    },
  );
}