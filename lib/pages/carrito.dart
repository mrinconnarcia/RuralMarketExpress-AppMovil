import 'package:flutter/material.dart';
import 'package:movil_project/pages/favorite.dart';
import 'package:movil_project/pages/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Nueva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrito de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Car(),
    );
  }
}

class Product {
  final String name;
  final IconData icon;
  final double price;
  int quantity;

  Product({required this.name, required this.icon, required this.price, this.quantity = 1});
}

class Car extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Car> {
  List<Product> products = [
    Product(name: 'Producto 1', icon: Icons.shopping_bag, price: 10.0),
    Product(name: 'Producto 2', icon: Icons.shopping_bag, price: 20.0),
    Product(name: 'Producto 3', icon: Icons.shopping_bag, price: 30.0),
    Product(name: 'Producto 4', icon: Icons.shopping_bag, price: 40.0),
  ];

  double get subtotal => products.fold(0, (total, current) => total + current.price * current.quantity);
  double get iva => subtotal * 0.16; // Assuming 16% VAT
  double get total => subtotal + iva;

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(products[index].icon),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(products[index].name),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (products[index].quantity > 1) {
                                    products[index].quantity--;
                                  }
                                });
                              },
                            ),
                            Text('${products[index].quantity}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  products[index].quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Text('\$${(products[index].price * products[index].quantity).toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          products.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        Text('Subtotal:', style: TextStyle(fontSize: 24)),
                        Text('\$${subtotal.toStringAsFixed(2)}', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('IVA:', style: TextStyle(fontSize: 24)),
                        Text('\$${iva.toStringAsFixed(2)}', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('Total:', style: TextStyle(fontSize: 24)),
                        Text('\$${total.toStringAsFixed(2)}', style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text('Comprar', style: TextStyle(fontSize: 24)),
                  onPressed: () {
                    // Aquí puedes agregar la lógica para manejar la compra
                  },
                ),
              ],
            ),
          ),
        ],
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
        index: 2,
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
                MaterialPageRoute(builder: (context) => Favoritos()),
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
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Otro()),
            //   );
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