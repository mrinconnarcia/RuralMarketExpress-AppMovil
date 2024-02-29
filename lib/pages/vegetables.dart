import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/home_page.dart';

class Otro extends StatefulWidget {
  @override
  _OtroState createState() => _OtroState();
}

class _OtroState extends State<Otro> {
  int _selectedIndex = 0;

  // Lista de URLs de imágenes para los productos
  List<String> productImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ26QV7jJv_Z1GXG2tcHQnw05cGEKTm7RH-Q&usqp=CAU',
    'https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dw3203bc93/images/product/0000000004763_A.jpg?sw=445&sh=445&sm=fit',
    'https://res.cloudinary.com/riqra/image/upload/v1685465485/sellers/merco-monterrey/products/nqb9ql9f29fa3tpfhk0f.jpg',
    'https://www.lavanguardia.com/files/og_thumbnail/uploads/2018/07/13/5e99856f0b685.jpeg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqa_TKm_-bzKjYBaCLwC76MMEZyL-4Os0dITwdRF3BK1AZZ7OSVlzZfiO03jhKlEr6OqY&usqp=CAU',
    'https://s1.abcstatics.com/media/MM/2022/12/28/lechuga-kpzB--662x441@abc.jpg',
    'https://www.ventadefrutasyverduras.com.mx/wp-content/uploads/2019/10/calabaza-larga.jpg',
    'https://www.65ymas.com/uploads/s1/48/33/91/bigstock-eggplant-or-aubergine-isolated-387693403.jpeg', // Agrega más URLs de imágenes según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
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
