import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/features/best_selling/views/best_selling_screen.dart';
import 'package:flower_app/features/home/data/model/category_model.dart';
import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flower_app/features/home/views/widgets/banner_widget.dart';
import 'package:flower_app/features/home/views/widgets/category_widget.dart';
import 'package:flower_app/features/home/views/widgets/search_home_widget.dart';
import 'package:flower_app/features/home/views/widgets/see_more.dart';
import 'package:flower_app/features/home/views/widgets/sweet_widget.dart';
import 'package:flower_app/features/product_details/views/cart_screen.dart';
import 'package:flower_app/features/product_details/views/favorite_screen.dart';
import 'package:flower_app/features/product_details/views/product_details.dart';
import 'package:flower_app/features/search/views/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(AppImages.logoImage,
          width: 80,
          height: 43,
        ),
        actions: [
          IconButton(
            onPressed:  ( ) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
            } ,
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer:  Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
              child: Row(
                children: [
                  Image.asset("assets/images/img_4.png"),
                  const SizedBox(width: 15,),
                  const Text("Rewan Elsonbaty",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartScreen()));
              },
              child: const ListTile(
                leading: Icon(Icons.shopping_cart,color: AppColors.rose,),
                title: Text("Cart",style: TextStyle(fontWeight: FontWeight.w500),),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoriteScreen()));
              },
              child: const ListTile(
                leading: Icon(Icons.favorite,color: AppColors.rose,),
                title: Text("Favorite",style: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter
              (
              child:  BannerWidget() ,
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                  onTap: ( )  {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return const SearchScreen();
                    }));
                  },
                  child: const SearchHomeWidget()),
            ),   const SliverToBoxAdapter(
              child: SeeMoreWidget(

                title: "Discover by category",
              ),
            ),

            SliverToBoxAdapter(
              child:  SizedBox(
                height: 95,
                child: ListView.separated(
                  separatorBuilder: (c,index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (c,index) {

                    return CategoryWidget(
                      index: index,
                    ) ;
                  } ,
                  itemCount: categories.length,

                ),
              ) ,
            ),

            SliverToBoxAdapter(
              child: SeeMoreWidget(
                onPressed: ( ){
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return const BestSellingScreen();
                  }));
                },
                title: "Best selling",
              ),
            ),
            SliverGrid.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 ,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 0.92
            ), itemBuilder: (c,index) {
              return   GestureDetector(
                onTap:  ( ) {


                  Navigator.push(context, MaterialPageRoute(builder: (C) {
                    return ProductDetails(
                      index: index,
                    );
                  } ));

                },
                child: SweetWidget(
                  index: index, title: bestSelling[index].title,

                ),
              );
            }  ,
                itemCount:2
            )



          ],
        ),
      ),

      // body: ,
    );
  }
}
