import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
                              child: Image.asset(
                                'assets/frozen_eat.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Cleaning'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/cleaning.jpg',
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
                            Text('Dairy'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/lacteos.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Vegetables'),
                            SizedBox(
                              height: 100.0,
                              width: 100.0,
                              child: Image.asset(
                                'assets/vegetables.jpg',
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
      bottomNavigationBar: Stack(
        children: [
          // GoogleNavBar (adjusted padding and positioning)
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0), // Reduced vertical padding
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    // ... (Add more tabs as needed)
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),

          // Footer positioned at the bottom (adjusted margin and padding)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0), // Reduced bottom margin
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.home, color: Colors.white),
                  const Icon(Icons.favorite, color: Colors.white),
                  const Icon(Icons.shopping_cart, color: Colors.white),
                  const Icon(Icons.person, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
