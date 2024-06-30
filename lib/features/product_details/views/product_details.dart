import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_fonts.dart';
import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flower_app/features/product_details/views/confirm_widget.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.index});
  final int index;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rose,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: const SizedBox(),

            toolbarHeight: MediaQuery.of(context).size.height*0.35,
            backgroundColor: AppColors.rose,
            flexibleSpace:  Center(
              child: Stack(
                children: [
                  SizedBox(
                    height:  MediaQuery.of(context).size.height*0.4,
                    width: double.infinity,
                    child: Image.asset(bestSelling[widget.index].image),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: ( ) {
                        Navigator.pop(context);
                      }
                          , icon:  const Icon(Icons.arrow_back))
                    ],
                  )
                ],
              ),
            ) ,
          ),
          SliverFillRemaining(
            child: Container(
              decoration:  const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),

                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(bestSelling[widget.index].title,
                          style: const TextStyle(
                              fontFamily: AppFonts.roboto,
                              fontWeight: FontWeight.w500,
                          fontSize: 22),
                          maxLines: 2 ,
                          overflow: TextOverflow.ellipsis,
                        )),
                        Text("${bestSelling[widget.index].price} LE",
                        style: const TextStyle(
                          fontFamily: AppFonts.roboto,
                          fontSize:20,
                          fontWeight:FontWeight.w500),
                        ),
                      ],
                    ) ,
                    const SizedBox(
                      height: 15,
                    ),
                    Text(bestSelling[widget.index].desc,style: const TextStyle(fontWeight: FontWeight.w400),) ,
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      color: AppColors.rose
                      ,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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

                              if(bestSelling[widget.index].count >0 ) {
                                setState(() {
                                  bestSelling[widget.index].count = bestSelling[widget.index].count - 1  ;
                                });
                              }
                            },
                            child: const CircleAvatar(
                              backgroundColor: AppColors.brown,
                              child: Icon(Icons.remove,

                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),

                          Text("${bestSelling[widget.index].count}"),
                          const SizedBox(width: 20,),
                          GestureDetector(
                            onTap: ( ) {
                              setState(() {
                                bestSelling[widget.index].count = bestSelling[widget.index].count + 1  ;
                              });
                            },
                            child: const CircleAvatar(
                              backgroundColor: AppColors.brown,
                              child: Icon(Icons.add,
                                color: Colors.white,

                              ),

                            ),
                          ),

                        ],
                      ),
                    ) ,
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColors.rose ,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(

                        children: [
                          Text("Selected items  (${bestSelling[widget.index].count})",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500
                          ),) ,
                          Expanded(child: Text("Total : ${bestSelling[widget.index].count *bestSelling[widget.index].price } LE",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500
                            ),
                          )) ,

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap:  ( ) {


                        cart.add(bestSelling[widget.index]);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConfirmScreen()));

                      } ,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        height: 50,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(8),
                            color: AppColors.brown
                        ),
                        child: const Text("Add to cart",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              color: AppColors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ) ;
  }
}