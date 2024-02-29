
import 'package:college_banha_app/Models/LevelsModel.dart';
import 'package:flutter/material.dart';

class Levels extends StatefulWidget {
  Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  static const  loremIpsum =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum';

  List<LevelItem> item = [
    LevelItem(header: 'المستوي الاول ', body: loremIpsum),
    LevelItem(header: 'المستوي الثاني  ', body: loremIpsum),
    LevelItem(header: 'المستوي الثالث ', body: loremIpsum),
    LevelItem(header: 'المستوي الرابع ', body: loremIpsum),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black87,
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);

        }, icon: Icon(Icons.arrow_back)),
        title:const Text('المستويات'),
        actions: [
          Image.asset('assets/image/logo.jpg',),

        ],
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: item
              .map((item) => ExpansionPanelRadio
            (

                  canTapOnHeader: true,
                  value: item.header,
                  headerBuilder: (context, isExpanded) => ListTile(
                        title: Text(
                          item.header,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                  body: ListTile(
                    title: Text(
                      item.body,
                      style: const TextStyle(fontSize: 20),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
