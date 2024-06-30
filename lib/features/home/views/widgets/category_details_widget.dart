import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            height: 118,
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColors.rose.withOpacity(0.25) ,
                      AppColors.white
                    ] ,
                    begin:Alignment.topLeft ,
                    end: Alignment.topRight
                ),
                borderRadius: BorderRadiusDirectional.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title),
                    const Text("There are many variations of \n passages of Lorem Ipsum"),
                    const Text("45. LE")
                  ],
                ),
                Image.asset(image,width: 90,)
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  bottomRight:Radius.circular(20),
                  topLeft:Radius.circular(3),
                  bottomLeft: Radius.circular(0),
                  topRight:Radius.circular(0),
                ),
              ),
              child: const Icon(Icons.add,
                color:AppColors.white,
              ),
            ),
          )
        ],
      );

  }
}
