import 'package:flutter/material.dart';
import 'package:movil_project/pages/login_screen.dart';
import 'package:movil_project/pages/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rural Market Express',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: const Color(0xFFE5F0EC), // Color de fondo de la aplicación
      ),
      home: MyHomePage(title: 'Rural Market Express'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor, // Utiliza el color de fondo de la aplicación
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'), // Asegúrate de tener una imagen llamada 'logo.png' en tu carpeta de assets
            Text(
              'RURAL MARKET EXPRESS',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  // TODO: Navegar a la página de registro
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                },
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white), // Cambia el color del texto a blanco
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 60)), // Aumenta la altura de los botones y agrega más separación en la parte superior
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), // Color de fondo del botón
              ),
            ),
            SizedBox(height: 20), // Añade más separación entre los botones
            ElevatedButton(
              onPressed: () {
                // TODO: Navegar a la página de registro
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignupPage()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white), // Cambia el color del texto a blanco
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 60)), // Aumenta la altura de los botones y agrega más separación en la parte superior
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow), // Color de fondo del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
