import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<SweetModel> favList = bestSelling.where((foodModel) => foodModel.fav==true).toList() ;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios),),
        title: const Text("Favorite"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/img_4.png"),
          )
        ],
      ),
      body: Expanded(
      child: ListView.builder(
      itemCount: favList.length,
      itemBuilder: (BuildContext context, int index) {
        return   Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              height: 118,
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
                      Text(favList[index].title),
                      const Text("There are many variations of \n passages of Lorem Ipsum"),
                      const Text("45. LE")
                    ],
                  ),
                  Image.asset(favList[index].image,width: 90,)
                ],
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child:

              IconButton(icon:const Icon(Icons.favorite),
                color:AppColors.rose, onPressed: () {
                  setState(() {
                    favList[index].fav = false;
                  });
                },

              ),
            ),
          ],
        );
     }

    )));

  }
}
