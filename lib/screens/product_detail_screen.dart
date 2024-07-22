import 'package:flutter/material.dart';
import 'package:flutter_staj_app/models/product_model.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(product.imageUrl,height: 400,fit: BoxFit.contain,)),
              SizedBox16(),
              Text(
                product.title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox8(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  Text(
                    '${product.price} TL',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
                  ),
                  Text(
                    '${product.category}',
                    style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_border_outlined),
                      Text(
                        '${product.rating.rate} ',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox16(),
              Text(
                product.description,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizedBox8 extends StatelessWidget {
  const SizedBox8({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 8.0);
  }
}

class SizedBox16 extends StatelessWidget {
  const SizedBox16({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16.0);
  }
}