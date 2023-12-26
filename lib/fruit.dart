import 'package:flutter/material.dart';
import 'package:app/class.dart';


class Fruit extends StatefulWidget {
  // const MyHomePage({super.key});
  final List<item> selected;
  Fruit({required this.selected});

  @override
  State<Fruit> createState() => _MyFruitPageState(selected: selected);
}

class _MyFruitPageState extends State<Fruit> {
  List<item> content2 = [
    item(
        name: 'Strawberry',
        price: 10,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/strawberry1.jpg'),
    item(
        name: 'Mango',
        price: 20,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/mango.png'),
    item(
        name: 'Dragon Fruit',
        price: 30,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/dragonfruit.jpg'),
    item(
        name: 'Banana',
        price: 40,
        quantity: 0,
        isSelected: false,
        image: 'lib/images/banana.jpg')
  ];

  List<item> selected;
  _MyFruitPageState({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'FRUITS',
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
                //empty the list...important
              },
              icon: Icon(Icons.cancel)),
          IconButton(
              onPressed: () {
                //i will come to it later
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Fruit()));
              },
              icon: Icon(Icons.forward_sharp))
        ],
      ),
      body: Center(
        child: Expanded(
          child: Container(
              //why container not column?
              child: ListView.builder(
                  itemCount: content2.length,
                  itemBuilder: (context, index) {
                    return Mycon(
                        content2[index].name,
                        content2[index].price,
                        content2[index].quantity,
                        content2[index].isSelected,
                        content2[index].image,
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
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '$name    $price Rs/kg',
              style: TextStyle(fontSize: 22),
            ),
          ),
          ListTile(
            leading: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                alignment: Alignment.center,
                width: 90,
                height: 44,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Quantity",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  //how to remove the text box on outside tap..???
                  onChanged: (String str) {
                    setState(() {
                      content2[index].quantity = double.parse(str);
                    });
                  },
                ),
              ),
            ), //making quantity selector..
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
                content2[index].isSelected = !content2[index].isSelected;
                if (content2[index].isSelected == true &&
                    content2[index].quantity != 0) {
                  selected.add(item(
                      name: name,
                      price: price,
                      quantity: quantity,
                      isSelected: isSelected,
                      image: image));
                } else {
                  selected.removeWhere(
                      (element) => element.name == content2[index].name);
                }
              });
            },
          ),
          Container(
            height: 3,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
