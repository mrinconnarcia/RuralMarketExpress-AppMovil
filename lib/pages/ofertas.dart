import 'package:flutter/material.dart';
import 'package:movil_project/services/product_service.dart';

class OfertasPage extends StatefulWidget {
  @override
  _OfertasPageState createState() => _OfertasPageState();
}

class _OfertasPageState extends State<OfertasPage> {
  late Future<List<Map<String, dynamic>>> futureOffers;

  @override
  void initState() {
    super.initState();
    futureOffers = ProductService().fetchOffers();
  }

  void _showDeleteConfirmationDialog(BuildContext context, String offerId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove offer'),
          content: Text('Are you sure you want to remove this offer?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await ProductService().deleteOffer(offerId);
                  setState(() {
                    futureOffers = ProductService().fetchOffers();
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Offer successfully eliminated'),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error when removing the offer: $e'),
                    ),
                  );
                }
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateOfferDialog(BuildContext context, Map<String, dynamic> offer) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController(text: offer['title']);
    final TextEditingController priceController = TextEditingController(text: offer['price'].toString());
    final TextEditingController descriptionController = TextEditingController(text: offer['description']);
    final TextEditingController discountController = TextEditingController(text: offer['discount'].toString());
    final TextEditingController availabilityController = TextEditingController(text: offer['availability']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update offer'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: discountController,
                  decoration: InputDecoration(labelText: 'Discount'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a discount';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: availabilityController,
                  decoration: InputDecoration(labelText: 'Availability'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter availability';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await ProductService().updateOffer(
                      offer['id'].toString(),
                      nameController.text,
                      double.parse(priceController.text),
                      descriptionController.text,
                      discountController.text,
                      availabilityController.text,
                    );
                    setState(() {
                      futureOffers = ProductService().fetchOffers();
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Offer updated successfully'),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error when updating the offer: $e'),
                      ),
                    );
                  }
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ofertas'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: futureOffers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final offer = snapshot.data![index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.network(
                        //   offer['urlImg'],
                        //   width: double.infinity,
                        //   height: 200.0,
                        //   fit: BoxFit.cover,
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer['title'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                offer['description'],
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Precio: \$${offer['price']}',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Descuento: ${offer['discount']}%',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Disponibilidad: ${offer['availability']}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _showDeleteConfirmationDialog(context, offer['id'].toString());
                                    },
                                    child: Text('Eliminar oferta'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _showUpdateOfferDialog(context, offer);
                                    },
                                    child: Text('Actualizar oferta'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Text('No hay ofertas disponibles');
            }
          },
        ),
      ),
    );
  }
}
