import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flower_app/features/product_details/views/cart_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios),),
        title: const Text("Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/img_4.png"),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cart.length,
          itemBuilder: (BuildContext context, int index) {
            return CartWidget( index: index,onPressed:(){
             setState(() {
               cart.removeAt(index);
             });
              });
          },
      ),
    );
  }
}
