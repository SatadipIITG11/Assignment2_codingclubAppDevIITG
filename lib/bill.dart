import 'package:flutter/material.dart';
import 'package:app/class.dart';
import 'package:app/fruit.dart';

class Bill extends StatefulWidget {
  // const MyHomePage({super.key});
  final List<item> selected;
  Bill({required this.selected});
  @override
  State<Bill> createState() => _MybillPageState(selected: selected);
}

class _MybillPageState extends State<Bill> {
  List<item> selected;
  _MybillPageState({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'BILL',
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
          // IconButton(
          //     onPressed: () {
          //       //i will come to it later
          //     },
          //     icon: Icon(Icons.forward_sharp))
        ],
      ),
      body: 
         Center(
           child: Expanded(
            child: Container(
              
              child: 
                ListView.builder(
                    itemCount: selected.length,
                    itemBuilder: (context, index) {
                      return MyBill(
                          selected[index].name,
                          selected[index].price,
                          selected[index].quantity,
                          selected[index].isSelected,
                          selected[index].image,
                          index
                      );
                    }),

                    
                    
              
              
            ),
                   ),
         ),

         bottomNavigationBar: 
          Container
          (
            alignment: Alignment.center,
            height: 50,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('TOTAL',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                Text('RS. ${sum(selected)}',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
         
      
    );
  }

// returning listtile..
  Widget MyBill(String name, int price, double quantity, bool isSelected,
      String image, int index) {
    return  Padding(
      padding: EdgeInsets.all(13),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(image),
        ),
        title: Text(name,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        subtitle: Text('$quantity kg   Rs.$price/kg'),
      
        trailing: Text('Rs. $price*$quantity',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }

  //finding total bill okay...

  double sum(List<item> L) {
    double s = 0;
    for (int i = 0; i < (L.length); i++) {
      s += (L[i].price) * (L[i].quantity);
    }

    return s;
  }
}
