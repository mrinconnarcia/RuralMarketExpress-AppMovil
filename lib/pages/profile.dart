import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/favorite.dart';
import 'package:movil_project/pages/home_page.dart';
import 'package:movil_project/services/product_service.dart'; // Importa el servicio para obtener el perfil del usuario
import 'package:movil_project/models/product_model.dart'; // Importa el modelo de perfil de usuario

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late Future<UserProfileModel> futureUserProfile;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    futureUserProfile = ProductService().fetchUserProfile(); // Llama a la función para obtener el perfil del usuario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<UserProfileModel>(
          future: futureUserProfile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final userProfile = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28),
                  Text(
                    'Hello!',
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    'Welcome, ${userProfile.firstName}',
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${userProfile.firstName} ${userProfile.lastName}'),
                      SizedBox(height: 20),
                      Text('E-mail: ${userProfile.email}'),
                      SizedBox(height: 20),
                      Text('Phone: ${userProfile.phone}'),
                      SizedBox(height: 20),
                      // Aquí puedes mostrar los demás datos del perfil
                    ],
                  ),
                  SizedBox(height: 24),
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
                      SizedBox(height: 22),
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
                  SizedBox(height: 24),
                ],
              );
            } else {
              return Text('No data found!');
            }
          },
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
        index: 3,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfil()),
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
