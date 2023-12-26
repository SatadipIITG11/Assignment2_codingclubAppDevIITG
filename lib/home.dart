import 'package:flutter/material.dart';
import 'package:app/veg.dart';

class Home extends StatefulWidget {
  // const MyHomePage({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "MyShop",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // I will do something later Ok..
            },
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 70),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 350,
                    height: 350,
                    child: Image.asset('lib/images/strawberry.jpg'),
                    
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      fixedSize: Size(170, 70)),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Veg())),
                  child: Text(
                    'SHOP NOW',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
