import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final List<Product> cartItems = [
    // Sepetteki ürünler...
  ];

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(0, (sum, item) => sum + item.price);
    return Scaffold(
      appBar: AppBar(title: Text("Sepet")),
      body: Column(children: [
        Expanded(child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: 
          (context,i)=>ListTile(
            leading: Image.network(cartItems[i].imageUrl),
            title: Text(cartItems[i].title),
            subtitle: Text(cartItems[i].price.toString()+" TL"),
            trailing: IconButton(
              icon: Icon(Icons.highlight_remove_outlined),
              onPressed: (){
              //Sepetten cıkarma islemi
            },
            ),
          )
          ),
          ),
          Text("Toplam: $total TL"),
          ElevatedButton(
            child: Text("Siparisi ver"),
            onPressed: (){})
      ],
      ),
    );
  }
}