import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_fonts.dart';
import 'package:flower_app/features/home/views/home_screen.dart';
import 'package:flower_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});


  PageController pageController= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(


          controller: pageController      ,
          itemBuilder: (c, index) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  onboardings[index].backgroundImage,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onboardings[index].image),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        onboardings[index].title,
                        style: const TextStyle(
                            fontSize: 24, fontFamily: AppFonts.rockFontFamily),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        onboardings[index].desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: AppFonts.sakkalMajalla, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        color: AppColors.brown,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(60),
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            )),
                        textColor: AppColors.white,
                        onPressed: () {


                          if(index== onboardings.length-1){

                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (c) {
                              return const HomeScreen();
                            }));

                          }else{
                            pageController.animateToPage(index+1, duration: const Duration(

                                seconds: 1
                            ), curve: Curves.slowMiddle);

                          }
                        },
                        child: Text(onboardings[index].buttonText),
                      ) ,
                      const SizedBox(
                        height: 14,
                      ),
                      SmoothPageIndicator(

                        controller: pageController,  // PageController
                        count:  onboardings.length,
                        // forcing the indicator to use a specific direction
                        effect:  ExpandingDotsEffect(
                            activeDotColor: AppColors.brown ,
                            dotHeight: 10,
                            dotColor: Colors.grey.withOpacity(0.5)
                        ),
                      ),

                    ],
                  ),
                )
              ],
            );
          },
          itemCount: onboardings.length,
        ));
  }
}