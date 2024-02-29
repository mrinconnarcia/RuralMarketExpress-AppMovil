import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/home_page.dart';

class frozen extends StatefulWidget {
  @override
  _FrozenState createState() => _FrozenState();
}

class _FrozenState extends State<frozen> {
  int _selectedIndex = 0;

  // Lista de URLs de imágenes para los productos
  List<String> productImages = [
    'https://cdn.shopify.com/s/files/1/0078/5730/7737/files/meatme_blog_130820_1_1024x1024.png?v=1597711066',
    'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00750104790256L.jpg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7AJaF0id6lVlPauyulGrVZ0dG-ndeRWzjpngWzkg6Iz26sn5GZsHFgWAeXoXa-QL8h24&usqp=CAU',
    'https://assets.unileversolutions.com/v1/55996109.png',
    'https://assets.unileversolutions.com/v1/55996224.png',
    'https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dwe0fa926b/images/product/7506390202756_A.jpg?sw=445&sh=445&sm=fit',
    'https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dwef767f6b/images/product/7500525498229_VALLEY%20FOODS_MEZCLA%20CAMPESINA_500G_A.jpg?sw=445&sh=445&sm=fit',
    'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00750649501078L.jpg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', // Agrega más URLs de imágenes según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frozen'),
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
                MaterialPageRoute(builder: (context) => frozen()),
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
                MaterialPageRoute(builder: (context) => frozen()),
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
