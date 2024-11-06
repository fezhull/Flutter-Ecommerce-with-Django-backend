import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/common/services/storage.dart';
import 'package:test1/common/utils/kcolors.dart';
import 'package:test1/common/utils/kstrings.dart';
import 'package:test1/common/widgets/app_style.dart';
import 'package:test1/common/widgets/custom_button.dart';
import 'package:test1/common/widgets/reusable_text.dart';
import 'package:test1/const/resource.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kolors.kWhite,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
            SizedBox(
              height: 30.h,
            ),
            Text(
              AppText.kWelcomeHeader,
              textAlign: TextAlign.center,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kWelcomeMessage,
                textAlign: TextAlign.center,
                style: appStyle(11, Kolors.kGray, FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GradientBtn(
              text: AppText.kGetStarted,
              btnHieght: 35,
              radius: 20,
              btnWidth: ScreenUtil().screenWidth - 100,
              onTap: () {
                ///TODO: uncommet the bool storage when the app is ready
                //Storage().setBool('firstOpen', true);
                context.go('/home');
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                    text: "Already have an account?",
                    style: appStyle(12, Kolors.kDark, FontWeight.normal)),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                    //navigate to login page
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}