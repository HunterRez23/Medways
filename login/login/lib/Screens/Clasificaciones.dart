import 'package:flutter/material.dart';
import 'package:login/Screens/Medicamentos.dart';
import 'package:login/Screens/PantallaPrincipal.dart';

void main() {
  runApp(Clasificaciones());
}

class Clasificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> Analgesicos = [
    {
      'imagePath': 'image/Ibuprofeno.png',
      'productName': 'Ibuprofeno',
      'description': 'Descripción de Ibuprofeno',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Aspirina.png',
      'productName': 'Aspirina',
      'description': 'Descripción de Aspirina',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Paracetamol.png',
      'productName': 'Paracetamol',
      'description': 'Descripción de Paracetamol',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Naproxeno.png',
      'productName': 'Naproxeno',
      'description': 'Descripción de Naproxeno',
      'price': '\$19.99',
    },
  ];

  final List<Map<String, String>> Antiinflamatorios = [
    {
      'imagePath': 'image/Declofenaco.png',
      'productName': 'Declofenaco',
      'description': 'Descripción de Declofenaco',
      'price': '\$29.99',
    },
    {
      'imagePath': 'image/Indometacina.png',
      'productName': 'Indometacina',
      'description': 'Descripción de Indometacina',
      'price': '\$29.99',
    },
    {
      'imagePath': 'image/Celecoxib.png',
      'productName': 'Celecoxib',
      'description': 'Descripción de Celecoxib',
      'price': '\$29.99',
    },
    {
      'imagePath': 'image/Daxocox.png',
      'productName': 'Daxocox',
      'description': 'Descripción de Daxocox',
      'price': '\$29.99',
    },
  ];
  final List<Map<String, String>> Antimicoticos = [
    {
      'imagePath': 'image/Fluconazol.png',
      'productName': 'Fluconazol',
      'description': 'Descripción de Fluconazol',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Ketoconazol.png',
      'productName': 'Ketoconazol',
      'description': 'Descripción de Ketoconazol',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Clotrimazol.png',
      'productName': 'Clotrimazol',
      'description': 'Descripción de Clotrimazol',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Miconazol.png',
      'productName': 'Miconazol',
      'description': 'Descripción de Miconazol',
      'price': '\$19.99',
    },
  ];
  final List<Map<String, String>> Antipireticos = [
    {
      'imagePath': 'image/Celecoxib.png',
      'productName': 'Celecoxib',
      'description': 'Descripción de Celecoxib',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Aspirina.png',
      'productName': 'Aspirina',
      'description': 'Descripción de Aspirina',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Ketoconazol.png',
      'productName': 'Ketoprofeno',
      'description': 'Descripción de Ketoprofeno',
      'price': '\$19.99',
    },
    {
      'imagePath': 'image/Naproxeno.png',
      'productName': 'Naproxeno',
      'description': 'Descripción de Naproxeno',
      'price': '\$19.99',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          YellowRectangle(
            child: Column(
              children: [
                Container(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 90.0,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PantallaPrincipal(),
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: SearchBox(),
                          ),
                          IconButton(
                            icon: const Icon(Icons.filter_list),
                            color: const Color.fromARGB(255, 255, 255, 255),
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  _buildProductList("Analgesicos", Analgesicos),
                  const SizedBox(height: 20.0),
                  _buildProductList("Antiinflamatorios", Antiinflamatorios),
                  const SizedBox(height: 20.0),
                  _buildProductList("Antimicoticos", Antimicoticos),
                  const SizedBox(height: 20.0),
                  _buildProductList("Antipireticos", Antipireticos),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(184, 2, 50, 129),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person, size: 50.0, color: Colors.white),
                  SizedBox(height: 8.0),
                  Text(
                    'Nombre de Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notificaciones'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Buscar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Categorias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Clasificaciones()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(String title, List<Map<String, String>> products) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 585,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(235, 109, 141, 190),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final producto = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicamentoScreen(
                          imagePath: producto['imagePath']!,
                          nombreMedicamento: producto['productName']!,
                          descripcionMedicamento: producto['description']!,
                        ),
                      ),
                    );
                  },
                  child: ProductRectangleWithText(
                    imagePath: producto['imagePath']!,
                    productName: producto['productName']!,
                    description: producto['description']!,
                    price: producto['price']!,
                  ),
                );
              },
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
      color: const Color.fromARGB(184, 2, 50, 129),
      height: 120,
      width: double.infinity,
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(186, 125, 172, 211),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: _isSearchEmpty ? 'Buscar' : '',
          hintStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(255, 255, 255, 255),
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

class ProductRectangleWithText extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String description;
  final String price;

  const ProductRectangleWithText({
    required this.imagePath,
    required this.productName,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0
        ),
        color: const Color.fromARGB(152, 2, 56, 129),
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Precio: $price',
                  style: const TextStyle(
                    color: Colors.white,
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