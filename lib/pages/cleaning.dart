import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/models/product_model.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/favorite.dart';
import 'package:movil_project/pages/home_page.dart';
import 'package:movil_project/pages/profile.dart';
import 'package:movil_project/services/product_service.dart';

class Limpieza extends StatefulWidget {
  @override
  _LimpiezaState createState() => _LimpiezaState();
}

class _LimpiezaState extends State<Limpieza> {
  late Future<List<ProductModel>> futureProducts;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    ProductService ps = ProductService();
    futureProducts = ps.fetchProducts();
  }

  Widget buildProducts(List<ProductModel> products) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (context, index) => Divider(), // Optional separator between items
      itemBuilder: (context, index) {
        final product = products[index];

        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)), // Adjust corner radius
          elevation: 5.0, // Add a shadow effect
          child: Padding(
            padding: EdgeInsets.all(10.0), // Add padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
              children: [
                // Image with a border
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(product.urlImg),
                ),
                SizedBox(height: 10.0), // Add spacing between image and text
                Text(product.name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(product.description, style: TextStyle(fontSize: 14.0)),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align price to the right
                  children: [
                    Text('\$ ' + product.price.toString(), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    Text('Add to basket', style: TextStyle(fontSize: 14.0, color: Colors.green)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cleaning'),
        backgroundColor: Color.fromARGB(255, 216, 214, 103),
      ),
      body: Center(
        child: FutureBuilder<List<ProductModel>>(
          future: futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              return buildProducts(snapshot.data!);
            } else {
              return Text('No data found!');
            }
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.amber.shade300,
        buttonBackgroundColor: Colors.amber.shade700,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'RuralMarketExpress')),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favoritos()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Nueva()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
              );
              break;
          }
        },
      ),
    );
  }
}
