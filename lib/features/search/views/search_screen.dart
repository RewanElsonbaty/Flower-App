import 'package:flower_app/features/home/data/model/sweet_model.dart';
import 'package:flower_app/features/home/views/widgets/sweet_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<SweetModel> searchList = [ ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


              Row(
                children: [
                  Expanded(child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        searchList = bestSelling.where((element) =>element.title.toLowerCase().contains(value.toLowerCase())).toList();
                      });


                      print(searchList.toList());



                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ) ,
                  )) ,
                  const Icon(Icons.search)
                ],
              ) ,
              const Divider(),
              Expanded(
                child: GridView.builder(
                    itemCount: searchList.isEmpty ?  bestSelling.length :searchList.length,
                    itemBuilder: (c,index) {
                      return   searchList.isEmpty ?  SizedBox(
                        height: 95,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0,right: 12),
                            child: SweetWidget(index: index, title: bestSelling[index].title),
                          )):
                      SizedBox(
                        height: 95,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0,right: 12),
                            child: SweetWidget(index: index, title: searchList[index].title),
                          ));
                    },  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),),
              )



            ],
          ),
        ),
      ),
    );
  }
}