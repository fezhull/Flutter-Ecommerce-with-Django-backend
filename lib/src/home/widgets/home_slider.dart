import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test1/common/utils/kcolors.dart';
import 'package:test1/const/constants.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
                indicatorColor: Kolors.kPrimaryLight,
                onPageChanged: (p) {
                  print(p);
                },
                children: List.generate(images.length, (i) {
                  return CachedNetworkImage(
                    placeholder: placeholder,
                    errorWidget: errorWidget,
                    imageUrl: images[i],
                  );
                })),
          )
        ],
      ),
    );
  }
}

List<String> images = [
  "https://d326fntlu7tb1e.cloudfront.net/uploads/1.webp",
  "https://d326fntlu7tb1e.cloudfront.net/uploads/1.webp",
  "https://d326fntlu7tb1e.cloudfront.net/uploads/1.webp",
  "https://d326fntlu7tb1e.cloudfront.net/uploads/1.webp",
];
