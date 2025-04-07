import 'package:flutter/material.dart';
import 'package:login/Screens/Consultorios.dart';
import 'package:login/Screens/DetalleConsultorio.dart';
import 'package:login/Screens/PantallaPrincipal.dart';

void main() {
  runApp(Medicos());
}

class Medicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void navigateToDetailScreen(BuildContext context, String imagePath, String productName, String description) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleConsultorio(
          imagePath: imagePath,
          productName: productName,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          YellowRectangle(
            onTapMenu: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            onPressedFilter: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Funcionalidad del carrito aún no implementada',
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 16.0,
                        top: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Medicos generales',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(235, 109, 141, 190),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  IconRectangle(),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(
                      context,
                      'image/Dr.1.png',
                      'Dr. Erick Alejandro',
                      'Medico general',
                    ),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Dr.1.png',
                      productName: 'Dr. Erick Alejandro',
                      description: 'Medico general',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(
                      context,
                      'image/Dr.5.png',
                      'Dr. César Castaños Cuevas',
                      'Medico general',
                    ),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Dr.5.png',
                      productName: 'Dr. César Castaños Cuevas',
                      description: 'Medico general',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(
                      context,
                      'image/Dr.6.png',
                      'Dr. Marco Antonio Souza Vazquez',
                      'Medico general',
                    ),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Dr.6.png',
                      productName: 'Dr. Marco Antonio Souza Vazquez',
                      description: 'Medico general',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 16.0,
                        top: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Especialistas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(235, 109, 141, 190),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  IconRectangle(),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(
                      context,
                      'image/Dr.4.png',
                      'Dr. Federico Alberto Perez Gonzalez',
                      'Endoscopista y Cirujano general',
                    ),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Dr.4.png',
                      productName: 'Dr. Federico Alberto Perez Gonzalez',
                      description: 'Endoscopista y Cirujano general',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(
                      context,
                      'image/Dr.3.png',
                      'Dr. Edgar Parra Ortega',
                      'Pediatra',
                    ),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Dr.3.png',
                      productName: 'Dr. Edgar Parra Ortega',
                      description: 'Pediatra',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(
                      context,
                      'image/Dr.2.png',
                      'Dr. Heriberto González Canal',
                      'Cirujano general',
                    ),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Dr.2.png',
                      productName: 'Dr. Heriberto González Canal',
                      description: 'Cirujano general',
                    ),
                  ),
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
                color: Colors.blue,
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
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Compras'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 62,
        elevation: 10,
        color: const Color.fromARGB(215, 109, 141, 190),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.medical_services_outlined),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaPrincipal()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.healing_sharp),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                // Add functionality for the second button
              },
            ),
          ],
        ),
      ),
    );
  }
}

class YellowRectangle extends StatelessWidget {
  final VoidCallback? onTapMenu;
  final VoidCallback? onPressedFilter;

  YellowRectangle({this.onTapMenu, this.onPressedFilter});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(184, 2, 50, 129),
      height: 115.0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Consultorios(),
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
              onPressed: onPressedFilter,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchController = TextEditingController();

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
          hintText: _searchController.text.isEmpty ? 'Buscar' : '',
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
          setState(() {});
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

class ProductRectangleWithText extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String description;

  const ProductRectangleWithText({
    required this.imagePath,
    required this.productName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(152, 2, 56, 129),
        borderRadius: BorderRadius.circular(10.0),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
