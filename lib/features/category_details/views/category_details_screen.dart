import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/features/category_details/data/model/category_details_model.dart';
import 'package:flower_app/features/home/views/widgets/category_details_widget.dart';
import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  List<MilkShakeModel> searchList = [ ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios),),
        title: const Text("Milkshake"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/img_4.png"),
          )
        ],
      ),
      body:  Column(
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        searchList = milkshakeList.where((element) =>element.title.toLowerCase().contains(value.toLowerCase())).toList();
                      });


                      print(searchList.toList());



                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ) ,
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
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:searchList.isEmpty ?  milkshakeList.length :searchList.length,
              itemBuilder: (BuildContext context, int index) {
                return searchList.isEmpty ? CategoryDetailsWidget(title: milkshakeList[index].title, image: milkshakeList[index].image):
                  CategoryDetailsWidget(title: milkshakeList[index].title, image: searchList[index].image);
              },
             ),
          ),
        ],
      ),
    );
  }
}
