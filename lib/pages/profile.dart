import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:movil_project/pages/carrito.dart';
import 'package:movil_project/pages/favorite.dart';
import 'package:movil_project/pages/home_page.dart';
import 'package:movil_project/services/product_service.dart'; // Importa el servicio para obtener el perfil del usuario

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late Future<Map<String, dynamic>> futureUserProfile;
  int _selectedIndex = 0;
  bool _showAddProductModal = false;
  bool _showAddOfferModal = false;
  String _productTitle = '';
  String _productDescription = '';
  num _productPrice = 0.0;
  String _productImageUrl = '';
  String _productDiscount = '';
  String _productAvailability = '';

  @override
  void initState() {
    super.initState();
    futureUserProfile = ProductService().fetchUserProfile();
  }

  void _showAddProductModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Product',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Product Title',
                ),
                onChanged: (value) {
                  setState(() {
                    _productTitle = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Product Description',
                ),
                onChanged: (value) {
                  setState(() {
                    _productDescription = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Product Price',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _productPrice = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Product Image URL',
                ),
                onChanged: (value) {
                  setState(() {
                    _productImageUrl = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await ProductService().addProduct(
                      _productTitle,
                      _productPrice,
                      _productDescription,
                      _productImageUrl,
                    );
                    print('Product added successfully');
                    setState(() {
                      _showAddProductModal = false;
                    });
                    Navigator.pop(context); // Close the modal after adding the product
                  } catch (e) {
                    print('Failed to add product: $e');
                  }
                },
                child: Text('Save'),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAddProductModal = false;
                  });
                  Navigator.pop(context); // Close the modal without adding the product
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddOfferModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Offer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Offer Title',
                ),
                onChanged: (value) {
                  setState(() {
                    _productTitle = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Offer Description',
                ),
                onChanged: (value) {
                  setState(() {
                    _productDescription = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Offer Price',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _productPrice = double.parse(value);
                  });
                },
              ),
              // SizedBox(height: 16.0),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Offer Image URL',
              //   ),
              //   onChanged: (value) {
              //     setState(() {
              //       _productImageUrl = value;
              //     });
              //   },
              // ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Offer Discount',
                ),
                onChanged: (value) {
                  setState(() {
                    _productDiscount = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Offer Availability',
                ),
                onChanged: (value) {
                  setState(() {
                    _productAvailability = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await ProductService().addOffer(
                      _productTitle,
                      _productPrice,
                      _productDescription,
                      _productDiscount,
                      _productAvailability,
                    );
                    print('Offer added successfully');
                    setState(() {
                      _showAddOfferModal = false;
                    });
                  } catch (e) {
                    print('Failed to add offer: $e');
                  }
                },
                child: Text('Save'),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAddOfferModal = false;
                  });
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<Map<String, dynamic>>(
          future: futureUserProfile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final userData = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 28),
                  Text(
                    'Hello!',
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    'Welcome, ${userData['name']}',
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${userData['name']} ${userData['lastname']}'),
                      SizedBox(height: 20),
                      Text('E-mail: ${userData['email']}'),
                      SizedBox(height: 20),
                      Text('Phone: ${userData['phone']}'),
                      SizedBox(height: 20),
                      Text('Birthday: ${userData['birthday']}'),
                      SizedBox(height: 20,)
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
                      SizedBox(height: 22),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showAddProductModal = true;
                          });
                          _showAddProductModalBottomSheet();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFAB100),
                        ),
                        child: Text('Add Product'),
                      ),
                      SizedBox(height: 22),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showAddOfferModal = true;
                          });
                          _showAddOfferModalBottomSheet();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFAB100),
                        ),
                        child: Text('Add Offer'),
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
