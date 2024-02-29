import 'package:flutter/material.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Otro extends StatefulWidget {
  @override
  _OtroState createState() => _OtroState();
}

class _OtroState extends State<Otro> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
        backgroundColor: Color.fromARGB(255, 216, 214, 103),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                // Navegar a la pantalla del carrito de compras al presionar el ícono
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Nueva()),
                );
              },
              child: Icon(
                Icons.shopping_cart,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.network(
                        'https://via.placeholder.com/150', // Aquí puedes reemplazar con la URL de la imagen del producto
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text('Producto ${index + 1}'),
                Text('precioo ${index + 1}.'),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 216, 214, 103), // Color del AppBar
                  ),
                  child: const Text('AGREGAR',
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {},
                ),
              ],
            ),
          );
        }),
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
        index: 1,
        onTap: (index) {
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
              // Navigate to your second page (replace with your actual widget)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Otro()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Nueva()), // Assuming Carrito is your cart page
              );
              break;
            case 3:
              // Navigate to your fourth page (replace with your actual widget)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Otro()),
              );
              break;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
