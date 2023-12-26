import 'package:flutter/material.dart';
import 'package:app/class.dart';
import 'package:app/fruit.dart';

class Veg extends StatefulWidget {
  // const MyHomePage({super.key});

  @override
  State<Veg> createState() => _MyVegPageState();
}

class _MyVegPageState extends State<Veg> {
  List<item> content = [
    item(
        name: 'Broccoli',
        price: 10,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/broccoli.jpg'),
    item(
        name: 'Tomato',
        price: 20,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/tomato.jpg'),
    item(
        name: 'Cabbage',
        price: 30,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/cabbage.jpeg'),
    item(
        name: 'Brinjal',
        price: 40,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/brinjal.jpg')
  ];

  List<item> selectedveg = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'VEGETABLES',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     // I will do something later Ok..
        //   },
        // ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              icon: Icon(Icons.cancel)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Fruit()));
              },
              icon: Icon(Icons.forward_sharp))
        ],
      ),
      body: Center(
        child: Expanded(
          child: Container(
              //why container not column?
              child: ListView.builder(
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return Mycon(
                        content[index].name,
                        content[index].price,
                        content[index].quantity,
                        content[index].isSelected,
                        content[index].image,
                        index);
                  })),
        ),
      ),
    );
  }

  Widget Mycon(String name, int price, double quantity, bool isSelected,
      String image, int index) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset(image),
            ),
          ),
          Text(
            '$name    $price Rs/kg',
            style: TextStyle(fontSize: 22),
          ),
          ListTile(
            leading: Icon(Icons.person), //arbitrary to check..
            trailing: isSelected
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green[700],
                  )
                : Icon(
                    Icons.check_circle_outline,
                    color: Colors.grey,
                  ),
            onTap: () {
              setState(() {
                content[index].isSelected = !content[index].isSelected;
                if (content[index].isSelected == true) {
                  selectedveg.add(item(
                      name: name,
                      price: price,
                      quantity: quantity,
                      isSelected: isSelected,
                      image: image));
                } else {
                  selectedveg.removeWhere(
                      (element) => element.name == content[index].name);
                }
              });
            },
          ),
          Container(
            height: 7,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
