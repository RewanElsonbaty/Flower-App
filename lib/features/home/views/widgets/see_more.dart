import 'package:flower_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SeeMoreWidget extends StatelessWidget {
  const SeeMoreWidget({super.key, required this.title, this.onPressed});
  final String title ;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title ,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 16),) ,
          const Spacer(),
          TextButton(
            onPressed:onPressed,
            child:const Text( "See More") ,
          ),
          const SizedBox(width: 8,),
          Image.asset(AppImages.seeMoreArrow)
        ],
      ),
    );
  }
}