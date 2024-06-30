import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flutter/material.dart';

class SweetWidget extends StatefulWidget {
  const SweetWidget({super.key, required this.index, required this.title});

  final int index;
  final String title;

  @override
  State<SweetWidget> createState() => _SweetWidgetState();
}

class _SweetWidgetState extends State<SweetWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:  Alignment.bottomRight,
      children: [
        Container(

          padding: const EdgeInsets.all(8),


          decoration: BoxDecoration(
              border: Border.all(color: AppColors.rose),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [
                    AppColors.rose.withOpacity(0.25) ,
                    AppColors.white
                  ] ,
                  begin:Alignment.topCenter ,
                  end: Alignment.bottomCenter
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Image.asset(bestSelling[widget.index].image)),
              Text(widget.title) ,
              Text(bestSelling[widget.index].desc,
                style: const TextStyle(
                    color:Color(0xff959595)
                ),
              ) ,Text(bestSelling[widget.index].price.toString()) ,
            ],
          ),
        ),
         Positioned(

            top: 0,
            right: 5,
            child: GestureDetector(
              onTap: (){

                setState(() {
                  bestSelling[widget.index].fav = !bestSelling[widget.index].fav;

                });

              },
                child: Icon(
                  bestSelling[widget.index].fav == true?
                  Icons.favorite
                      :
                  Icons.favorite_border,
                  color: AppColors.rose,
                ),)),
        Container(
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
        )
      ],
    );
  }
}