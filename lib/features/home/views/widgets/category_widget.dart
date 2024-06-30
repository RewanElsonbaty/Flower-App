import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/category_details/views/category_details_screen.dart';
import 'package:flower_app/features/home/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CategoryDetailsScreen()));
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColors.rose.withOpacity(0.6),
                      AppColors.rose.withOpacity(0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),
                color: AppColors.rose,
                shape: BoxShape.circle
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(categories[index].image,
                height: 50,
              ),
            ),
          ),
        ),
        Text(categories[index].title)
      ],
    );
  }
}