import 'package:flutter/material.dart';
import 'package:login/Screens/PantallaPrincipal.dart';
import 'package:login/Screens/Medicos.dart';
import 'package:login/Screens/Clasificaciones.dart';
import 'package:login/Screens/seguimiento.dart';

void main() {
  runApp(Consultorios());
}

class Consultorios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void navigateToDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Medicos(),
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
                        top:
                            20.0), // Ajustar el espacio a la izquierda y arriba
                    child: Align(
                      alignment: Alignment
                          .centerLeft, // Alinear el texto a la izquierda
                      child: Text(
                        'Clínicas cercanas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(235, 109, 141, 190),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          16.0), // Espacio entre el texto y los contenedores
                  IconRectangle(),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(context),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Similares.jpg',
                      productName: 'Similar',
                      description: '4.8km de distancia',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(context),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Benavides.jpg',
                      productName: 'Benavides',
                      description: '4.6km de distancia',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(context),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/ClinicaNaval.jpg',
                      productName: 'Clinica Naval',
                      description: '3.6km de distancia',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(context),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Marketplace.png',
                      productName: 'Laboratorio de analisis clinicos',
                      description: '2.3km de distancia',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToDetailScreen(context),
                    child: const ProductRectangleWithText(
                      imagePath: 'image/Marketplace.png',
                      productName: 'Clinica Dr.[Nombre]',
                      description: '2.5km de distancia',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaPrincipal()),
                );
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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 62,
        elevation: 0,
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
              },
            ),
            IconButton(
              icon: const Icon(Icons.message),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Seguimiento()),
                );
                },
            )
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
            InkWell(
              onTap: onTapMenu,
              child: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 255, 255,
                    255), // Cambia el color aquí según tus necesidades
              ),
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
