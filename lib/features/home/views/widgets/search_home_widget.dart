import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchHomeWidget extends StatelessWidget {
  const SearchHomeWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.black)
            ),
            child: Text("Search  Here",
              style: TextStyle(
                color: AppColors.brown.withOpacity(0.3),

              ),
            ),
          ),
        ),
        const SizedBox(width: 13,),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: AppColors.rose,
              borderRadius: BorderRadius.only(
                  topRight:  Radius.circular(15),
                  topLeft: Radius.circular(15) ,
                  bottomRight:  Radius.circular(15)
              )
          ),
          child: const Icon(Icons.search),
        )
      ],
    );
  }
}