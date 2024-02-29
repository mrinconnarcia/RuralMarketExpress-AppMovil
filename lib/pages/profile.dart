import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28), // Añade más espacio aquí
            Text(
              'Hello!',
              style: TextStyle(fontSize: 28),
            ),
            Text(
              'Welcome, Martin',
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20), // Añade más espacio aquí
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: Martin'),
                SizedBox(height: 20), // Añade más espacio aquí
                Text('Last name: Rincon Narcia'),
                SizedBox(height: 20), // Añade más espacio aquí
                Text('E-mail: martin@gmail.com'),
                SizedBox(height: 20), // Añade más espacio aquí
                Text('Phone: 9612851122'),
                SizedBox(height: 20), // Añade más espacio aquí
                Text('Birthday date: 12/10/2002'),
                SizedBox(height: 20), // Añade más espacio aquí
                Text('Gender: Male'),
                SizedBox(height: 20), // Añade más espacio aquí
                Text('Suchiapa, Chiapas, Mexico. '),
              ],
            ),
            SizedBox(height: 24), // Añade más espacio aquí
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle update information button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC7DE85),
                  ),
                  child: Text('Update information'),
                ),
                SizedBox(height: 22), // Añade más espacio aquí
                ElevatedButton(
                  onPressed: () {
                    // Handle delete account button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFAB100),
                  ),
                  child: Text('Delete Account'),
                ),
              ],
            ),
            SizedBox(height: 24), // Añade más espacio aquí
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
          // Aquí puedes implementar la navegación correspondiente
          switch (index) {
            case 0:
            // Navegar a la pantalla principal
              break;
            case 1:
            // Navegar a la pantalla de favoritos
              break;
            case 2:
            // Navegar a la pantalla del carrito de compras
              break;
            case 3:
            // Navegar a la pantalla de perfil
              break;
          }
        },
      ),
    );
  }
}
