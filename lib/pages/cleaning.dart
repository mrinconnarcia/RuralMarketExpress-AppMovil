import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/home_page.dart';

class Limpieza extends StatefulWidget {
  @override
  _LimpiezaState createState() => _LimpiezaState();
}

class _LimpiezaState extends State<Limpieza> {
  int _selectedIndex = 0;

  // Lista de URLs de imágenes para los productos
  List<String> productImages = [
    'https://images.ecestaticos.com/U4ZuVOaouVSFJc_yKw18Y7046iA=/18x0:447x458/1440x1920/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2Fd48%2F7a1%2F259%2Fd487a12590a2135f013c9d8f19374496.jpg',
    'https://m.media-amazon.com/images/I/81TNaERsgiL._AC_SY879_.jpg',
    'https://m.media-amazon.com/images/I/81edOUviBZL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/71x03tsSihL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/81-Le25glaL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/61pQXeBOWTL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/71QxSsE51WL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://m.media-amazon.com/images/I/61VrnW1QtHL._AC_SL1000_.jpg', // Agrega más URLs de imágenes según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cleaning'),
        backgroundColor: Color.fromARGB(255, 216, 214, 103),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(productImages.length, (index) {
          return Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.network(
                        productImages[index], // URL de la imagen del producto
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
                MaterialPageRoute(builder: (context) => Limpieza()),
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
                MaterialPageRoute(builder: (context) => Limpieza()),
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
