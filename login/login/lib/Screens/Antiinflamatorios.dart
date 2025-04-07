import 'package:flutter/material.dart';
import 'Medicamentos.dart';

class Antiinflamatorios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YellowRectangle(
            child: Column(
              children: [
                Container(
                  height: 115.0, // Fixed height for the container
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: SearchBox(),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Funcionalidad del carrito aún no implementada',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Other content within YellowRectangle
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 0.0),
                  
                  IconRectangle(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicamentoScreen(
                            imagePath: 'image/Similares.jpg',
                            nombreMedicamento: 'Diclofenaco',
                            descripcionMedicamento: 'Descripción',
                          ),
                        ),
                      );
                    },
                    child: ProductRectangle(
                      imagePath: 'image/Similares.jpg',
                      productName: 'Diclofenaco',
                      description: 'Descripción',
                      price: '\$19.99',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicamentoScreen(
                            imagePath: 'image/Benavides.jpg',
                            nombreMedicamento: 'Indometacina',
                            descripcionMedicamento: 'Descripción',
                          ),
                        ),
                      );
                    },
                    child: ProductRectangle(
                      imagePath: 'image/Benavides.jpg',
                      productName: 'Indometacina',
                      description: 'Descripción',
                      price: '\$19.99',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicamentoScreen(
                            imagePath: 'image/ClinicaNaval.jpg',
                            nombreMedicamento: 'Celecoxib',
                            descripcionMedicamento: 'Descripción',
                          ),
                        ),
                      );
                    },
                    child: ProductRectangle(
                      imagePath: 'image/ClinicaNaval.jpg',
                      productName: 'Celecoxib',
                      description: 'Descripción',
                      price: '\$19.99',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicamentoScreen(
                            imagePath: 'image/ClinicaNaval.jpg',
                            nombreMedicamento: 'Ibuprofeno',
                            descripcionMedicamento: 'Descripción',
                          ),
                        ),
                      );
                    },
                    child: ProductRectangle(
                      imagePath: 'image/ClinicaNaval.jpg',
                      productName: 'Ibuprofeno',
                      description: 'Descripción',
                      price: '\$19.99',
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicamentoScreen(
                            imagePath: 'image/ClinicaNaval.jpg',
                            nombreMedicamento: 'Naproxeno',
                            descripcionMedicamento: 'Descripción',
                          ),
                        ),
                      );
                    },
                    child: ProductRectangle(
                      imagePath: 'image/ClinicaNaval.jpg',
                      productName: 'Naproxeno',
                      description: 'Descripción',
                      price: '\$19.99',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class YellowRectangle extends StatelessWidget {
  final Widget child;

  YellowRectangle({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 115.0,
      width: double.infinity, // Change the color as per your need
      child: child,
    );
  }
}

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearchEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: _isSearchEmpty ? 'Buscar' : '',
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              String searchTerm = _searchController.text;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Buscando: $searchTerm'),
                ),
              );
            },
          ),
        ),
        onChanged: (value) {
          setState(() {
            _isSearchEmpty = value.isEmpty;
          });
        },
      ),
    );
  }
}

class IconRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

class ProductRectangle extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String description;
  final String price;

  ProductRectangle({
    required this.imagePath,
    required this.productName,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey, // Cambia el color del texto a gris
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Precio: $price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
