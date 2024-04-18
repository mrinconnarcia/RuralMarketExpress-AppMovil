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
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle edit button press
                            _openEditProductModal(product);
                          },
                          child: Text('Edit', style: TextStyle(color: Colors.blue)),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle add to basket button press
                            // You can add the product to the basket here
                            print('Add to basket: ${product.name}');
                          },
                          child: Text('Add to basket', style: TextStyle(color: Colors.green)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _openEditProductModal(ProductModel product) async {
    final editedProduct = await showDialog<ProductModel>(
      context: context,
      builder: (BuildContext context) {
        String name = product.name;
        num price = product.price;
        String description = product.description;
        String urlImg = product.urlImg;

        return AlertDialog(
          title: Text('Edit Product'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) => name = value,
                ),
                TextFormField(
                  initialValue: price.toString(),
                  decoration: InputDecoration(labelText: 'Price'),
                  onChanged: (value) => price = num.parse(value),
                ),
                TextFormField(
                  initialValue: description,
                  decoration: InputDecoration(labelText: 'Description'),
                  onChanged: (value) => description = value,
                ),
                TextFormField(
                  initialValue: urlImg,
                  decoration: InputDecoration(labelText: 'Image URL'),
                  onChanged: (value) => urlImg = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Save changes and update product
                final updatedProduct = ProductModel(
                  id: product.id,
                  name: name,
                  price: price.toDouble(),
                  description: description,
                  urlImg: urlImg,
                );
                try {
                  await ProductService().updateProduct(
                    updatedProduct.id,
                    updatedProduct.name,
                    updatedProduct.price,
                    updatedProduct.description,
                    updatedProduct.urlImg,
                  );
                  // Refresh product list
                  setState(() {
                    futureProducts = ProductService().fetchProducts();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Product updated successfully'),
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Failed to update product: $e'),
                  ));
                }
                Navigator.of(context).pop(updatedProduct);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    // Update the product list if the product was edited
    if (editedProduct != null) {
      // Call updateProduct method from ProductService
    }
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
