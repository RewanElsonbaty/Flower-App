import 'package:flower_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.bannerImage) ,
        const Positioned(
            top: 15,

            child: Text("Choose What Suits \n Your Test"))
      ],
    )     ;
  }
}