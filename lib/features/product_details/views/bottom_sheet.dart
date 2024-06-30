
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
              child: Image.asset("assets/lotties/img.png"),

              // Lottie.asset('assets/lotties/done.json',
              //   width: 200,
              //   height: 200,
              //   fit: BoxFit.fill,
              //   // Optional parameters
              //   repeat: true,  // Default is true
              //   reverse: false,  // Default is false
              //   animate: true,  // Default is true
              // )
          ),
          const Text("Order confirmed successfully"),
          GestureDetector(
            onTap:  ( ) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));

            } ,
            child: Container(
              alignment: Alignment.center,
              height: 100,
              decoration: const BoxDecoration(
                  color: AppColors.brown
              ),
              child: const Text("Back to home",
                style: TextStyle(
                    color: AppColors.white
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}