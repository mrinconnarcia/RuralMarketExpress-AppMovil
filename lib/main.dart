import 'package:flutter/material.dart';
import 'package:project/pages/login_screen.dart'; // Import the LoginScreen class
import 'package:project/pages/signup_screen.dart'; // Import the SignupScreen class
//cambiar el nombre de acuerdo al proyecto LEER AQUI
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
        backgroundColor: const Color(0xFFE5F0EC),
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo.png'),
            Text(
              'RURAL MARKET EXPRESS',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 60)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(Size(200, 60)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
