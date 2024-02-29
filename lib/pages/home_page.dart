import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/pages/cleaning.dart';
import 'package:movil_project/pages/dairy.dart';
import 'package:movil_project/pages/favorite.dart';
import 'package:movil_project/pages/frozen.dart';
import 'package:movil_project/pages/vegetables.dart';
import 'package:movil_project/pages/carrito.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MyHomePage(title: 'RuralMarketExpress'),
    Otro(), // Cambia por tu widget real
    Nueva(), // Cambia por tu widget real
    Otro(), // Cambia por tu widget real
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Image.asset('assets/logo_movil.jpg'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/main-shop.jpg'),
            ),

            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20 ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       const SizedBox(height: 30),
            //       ElevatedButton(
            //         style: style,
            //         onPressed: () {},
            //         child: const Text('Enabled'),
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              // margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.yellow[400],
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              child: Text(
                'CATEGORIES',
                style: TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Frozen'),
                            SizedBox(
                                height: 100.0,
                                width: 100.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => frozen()),
                                    ); // Aquí puedes agregar la lógica para navegar a la página deseada
                                  },
                                  child: Image.asset(
                                    'assets/frozen_eat.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Cleaning'),
                            SizedBox(
                                height: 100.0,
                                width: 100.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Limpieza()),
                                    ); // Aquí puedes agregar la lógica para navegar a la página deseada
                                  },
                                  child: Image.asset(
                                    'assets/cleaning.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Dairy'),
                            SizedBox(
                                height: 100.0,
                                width: 100.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Queso()),
                                    ); // Aquí puedes agregar la lógica para navegar a la página deseada
                                  },
                                  child: Image.asset(
                                    'assets/lacteos.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Vegetables'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Otro()),
                                  ); // Aquí puedes agregar la lógica para navegar a la página deseada
                                },
                                child: Image.asset(
                                  'assets/vegetables.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Fruits'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/fruits.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Soft Drinks'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/drink.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Pasta'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/pasta.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Candy'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/candy.jpg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Beers'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/beers.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Oils'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/oils.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'RuralMarketExpress')),
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
                MaterialPageRoute(builder: (context) => Nueva()), // Assuming Carrito is your cart page
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