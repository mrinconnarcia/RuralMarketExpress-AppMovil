import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/models/product_model.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/favorite.dart';
import 'package:movil_project/pages/home_page.dart';
import 'package:movil_project/pages/profile.dart';
import 'package:movil_project/services/product_service.dart';

class Queso extends StatefulWidget {
  @override
  _QuesoState createState() => _QuesoState();
}

class _QuesoState extends State<Queso> {
  int _selectedIndex = 0;
  late Future<List<ProductModel>> futureProducts;
  late Future<ProductModel> futureProduct;

  @override
  void initState() {
    super.initState();

    // Inicializamos futureProducts para obtener la lista de productos
    ProductService ps = ProductService();
    futureProducts = ps.fetchProducts();

    // Inicializamos futureProduct para obtener un producto específico (por ejemplo, '300524d8-adf6-4d5d-9ef5-cc39db98e281')
    futureProduct = ps.fetchProduct('300524d8-adf6-4d5d-9ef5-cc39db98e281');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dairy'),
        backgroundColor: Color.fromARGB(255, 216, 214, 103),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Ejemplo de cómo usar futureProducts para mostrar una lista de productos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FutureBuilder<List<ProductModel>>(
                        future: futureProducts,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(snapshot.data![index].name),
                                  subtitle: Text(
                                      snapshot.data![index].description),
                                );
                              },
                            );
                          } else {
                            return Text('No data found!');
                          }
                        },
                      )),
                );
              },
              child: Text('Mostrar Lista de Productos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ejemplo de cómo usar futureProduct para mostrar un producto específico
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FutureBuilder<ProductModel>(
                        future: futureProduct,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nombre: ${snapshot.data!.name}'),
                                Text(
                                    'Descripción: ${snapshot.data!.description}'),
                                Text('Precio: \$ ${snapshot.data!.price}'),
                              ],
                            );
                          } else {
                            return Text('No data found!');
                          }
                        },
                      )),
                );
              },
              child: Text('Mostrar Producto Específico'),
            ),
          ],
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
                MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(title: 'RuralMarketExpress')),
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
