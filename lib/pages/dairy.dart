import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/home_page.dart';

class Queso extends StatefulWidget {
  @override
  _QuesoState createState() => _QuesoState();
}

class _QuesoState extends State<Queso> {
  int _selectedIndex = 0;

  // Lista de URLs de imágenes para los productos
  List<String> productImages = [
    'https://www.miym.com.mx/wp-content/uploads/2021/05/ecolean_producto_banner.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTziifiZsLF1YhGqJJ7qfY5n4auysnUYw6pOA&usqp=CAU',
    'https://chedrauimx.vtexassets.com/arquivos/ids/26909371/7501020563733_00.jpg?v=638443416538900000',
    'https://latexana.mx/wp-content/uploads/2020/07/5117-1.jpg',
    'https://res.cloudinary.com/riqra/image/upload/w_656,h_656,c_limit,q_auto,f_auto/v1678811231/sellers/11/tbyjgfgwtryszc8gwp2n.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzxbo-b6VPSukXNPwELAyeApgCFoa6SKpyCBM_wAtGvbFWopH8aOOiAAdwCN_2O8dMSto&usqp=CAU',
    'https://www.mayoreototal.mx/cdn/shop/products/3c4a1144-1aff-48e7-8c9e-4ff55d9b509b_350x.jpg?v=1604439703',
    'https://mvsnoticias.com/u/fotografias/m/2023/11/1/f768x1-573943_574070_21.png', // Agrega más URLs de imágenes según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dairy'),
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
                MaterialPageRoute(builder: (context) => Queso()),
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
                MaterialPageRoute(builder: (context) => Queso()),
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
