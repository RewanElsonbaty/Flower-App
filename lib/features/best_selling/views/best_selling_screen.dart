import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flower_app/features/home/views/widgets/sweet_widget.dart';
import 'package:flutter/material.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios),),
        title: const Text("Best Selling"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/img_4.png"),
          )
        ],
      ),
      body: GridView.builder(
          itemCount: bestSelling.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemBuilder: (c,index) {
            return   Padding(
              padding: const EdgeInsets.only(right: 12,bottom: 10),
              child: SweetWidget(
                index: index, title: bestSelling[index].title,

              ),
            );
          } ),
    );
  }
}