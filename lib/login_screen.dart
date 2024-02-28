import 'package:flutter/material.dart';
import 'package:movil_project/home_page.dart';
import 'package:movil_project/signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Center(
                  child: Text(
                    "Enter your email and password to log in.",
                    style: TextStyle(fontSize: 16.0),
                  )),
              const SizedBox(height: 40.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The e-mail address is required";
                        }
                        if (!RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                            .hasMatch(value)) {
                          return "Invalid e-mail address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The password is required";
                        }
                        if (value.length < 6) {
                          return "The password must be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                      width: 200.0,
                    ),
                    SizedBox(
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // TODO: Iniciar sesión con Firebase
                            // Si el inicio de sesión es exitoso:
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage(
                                      title: 'RuralMarketExpress')),
                            );
                          }
                        },
                        child: const Text("Log In"),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size.fromWidth(350.0), // Ajusta el ancho aquí
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.yellow.shade400),
                          foregroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors
                                    .black; // Color del texto cuando el botón está presionado
                              } else {
                                return Colors
                                    .white; // Color del texto en estado normal
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // TODO: Navegar a la página de registro
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    child: const Text("Sign Up"),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors
                                .green; // Color del texto cuando el botón está presionado
                          } else {
                            return Colors.green
                                .shade400; // Color del texto en estado normal
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}