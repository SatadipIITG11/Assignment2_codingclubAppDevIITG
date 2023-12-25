import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // const MyHomePage({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text("SHOP",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: Colors.white),),
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // I will do something later Ok..
            },
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                child:Image.asset('lib/images/strawberry.jpg')
              )
            ],
          ),
        )
        );
  }
}