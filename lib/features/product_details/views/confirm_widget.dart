import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset("assets/images/img_8.png"),
            SizedBox(
              child: Image.asset("assets/lotties/img.png",width: 200,),
            ),
            const Text("Order confirmed successfully"),
            const SizedBox(height: 100,),
            GestureDetector(
              onTap:  ( ) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      
              } ,
              child: Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
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
      ),
    );
  }
}