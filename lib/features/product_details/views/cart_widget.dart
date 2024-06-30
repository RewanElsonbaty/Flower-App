import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.index, this.onPressed});
  final int index;
final  void Function()? onPressed;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(12),
          height: 150,
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
                  Text(cart[widget.index].title),
                  const Text("There are many variations of \n passages of Lorem Ipsum"),
                  Text("price : ${cart[widget.index].price} LE"),
                  Text("Total : ${cart[widget.index].count *cart[widget.index].price } LE")
                ],
              ),
              Column(
                children: [
                  Image.asset(cart[widget.index].image,width: 70,),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xffF7CCC6),
                              Color(0xffFCEFED),
                              Color(0xffFFFFFF),
                            ]
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [


                        GestureDetector(
                          onTap: ( ) {

                            if(cart[widget.index].count >0 ) {
                              setState(() {
                                cart[widget.index].count = cart[widget.index].count - 1  ;
                              });
                            }
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.brown,
                            child: Icon(Icons.remove,

                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),

                        Text("${cart[widget.index].count}"),
                        const SizedBox(width: 15,),
                        GestureDetector(
                          onTap: ( ) {
                            setState(() {
                              cart[widget.index].count = cart[widget.index].count + 1  ;
                            });
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.brown,
                            child: Icon(Icons.add,
                              color: Colors.white,

                            ),

                          ),
                        ),

                      ],
                    ),
                  ) ,
                ],
              )
            ],
          ),
        ),
         Positioned(
          top: 15,
          right: 15,
          child:
          IconButton(icon:const Icon(Icons.cancel),
              color:AppColors.black, onPressed: widget.onPressed
          ),
        ),
      ],

    );
  }
}
