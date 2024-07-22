import 'package:flutter/material.dart';
import 'package:flutter_staj_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';


class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Categories'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Category 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Category 2'),
              onTap: () {},
            ),
            // Add more categories here
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Products'),
      ),
      body: ProductListContainer(),
    );
  }
}

class ProductListContainer extends StatelessWidget {
  const ProductListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Provider.of<ProductProvider>(context, listen: false).fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null ||snapshot.data!=null) {
            print(snapshot);
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          } else {
            return Card(
              child: Consumer<ProductProvider>(
                builder: (ctx, productProvider, child) => ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: Image.network(productProvider.products[i].imageUrl,fit: BoxFit.contain,height: 150,width: 75,),
                    title: Text(productProvider.products[i].title),
                    subtitle: Text('${productProvider.products[i].price} TL'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${productProvider.products[i].rating.count}'),
                        Text('${productProvider.products[i].rating.rate}'),

                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ProductDetailScreen(product: productProvider.products[i]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}





/*
     GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, i) {
          
          return  InkResponse(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(product: products[i],)));},
            
            child: GridTile(
              header: Text(products[i].name),
              footer: Text(products[i].price.toString()),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.network(products[i].imageUrl,height: 150,fit: BoxFit.fill),
              )),
          ) ;
          
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
        ),
      )
 */


 /*ListView.builder( 
        itemCount: products.length,
        itemBuilder: (context,i)=>Card(
          child: 
          ListTile(
            leading: Image.network(products[i].imageUrl,height: 150,fit: BoxFit.fill),
            title: Text(products[i].name),
            subtitle: Text(products[i].price.toString()),
            onTap: (){
              //urun detay sayfasina git.
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(product: products[i],)));
            },
            ),
        ),
        ),*/