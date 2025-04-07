import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255),),
        )
      ),
      home: MedicamentoScreen(
        imagePath: 'image/medicamento.png',
        nombreMedicamento: 'Nombre del Medicamento',
        descripcionMedicamento: 'Descripción del Medicamento',
      ),
    );
  }
}

class MedicamentoScreen extends StatelessWidget {
  final String imagePath;
  final String nombreMedicamento;
  final String descripcionMedicamento;

  MedicamentoScreen({
    required this.imagePath,
    required this.nombreMedicamento,
    required this.descripcionMedicamento,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255),),
        title: const Text(
          'Detalles del Medicamento',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromARGB(183, 2, 56, 129),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              transform: Matrix4.translationValues(0.0, 20.0, 0.0),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombreMedicamento,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    descripcionMedicamento,
                    style: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: AdvertenciaBar(
                          icon: Icons.pregnant_woman,
                          label: 'Embarazo',
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: AdvertenciaBar(
                          icon: Icons.local_hospital,
                          label: 'Vía',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ubicaciones.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          UbicacionCard(
                            nombre: ubicaciones[index]['nombre']!,
                            distancia: ubicaciones[index]['distancia']!,
                            latitud: ubicaciones[index]['latitud']!,
                            longitud: ubicaciones[index]['longitud']!,
                          ),
                          const SizedBox(height: 10.0),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1.0,
                            height: 1.0,
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdvertenciaBar extends StatelessWidget {
  final IconData icon;
  final String label;

  AdvertenciaBar({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50.0,
          color: Colors.grey,
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class UbicacionCard extends StatelessWidget {
  final String nombre;
  final String distancia;
  final String latitud;
  final String longitud;

  UbicacionCard({
    required this.nombre,
    required this.distancia,
    required this.latitud,
    required this.longitud,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            'image/MapaPin.jpg',
            width: 40.0, // Ancho de la imagen
            height: 40.0, // Altura de la imagen
            fit: BoxFit.cover, // Ajuste de la imagen
          ),
          const SizedBox(width: 16.0), // Espacio entre la imagen y el texto
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Distancia: $distancia',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  _launchMapsUrl(latitud,
                      longitud); // Llama al método para abrir la ubicación
                },
                child: const Text(
                  'Abrir ubicación',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Función para abrir la app de mapas
  void _launchMapsUrl(String latitud, String longitud) async {
    final url =
        'https://www.google.com/maps/search/?api=1&query=$latitud,$longitud';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la app de mapas';
    }
  }
}

List<Map<String, String>> ubicaciones = [
  {
    'nombre': 'Benavides',
    'imagePath': 'image/MapPin.jpg',
    'latitud': '28.408456',
    'longitud': '-106.863665',
    'distancia': '4.6 km',
  },
  {
    'nombre': 'Farmacia del Ahorro',
    'imagePath': 'image/MapPin.jpg',
    'latitud': '28.394880',
    'longitud': '-106.878309',
    'distancia': '3.5 km',
  },
  {
    'nombre': 'Farmacia Guadalajara',
    'imagePath': 'image/MapPin.jpg',
    'latitud': '28.407185',
    'longitud': '-106.865960',
    'distancia': '4.6 km',
  },
  {
    'nombre': 'Farmacias Similares',
    'imagePath': 'image/MapPin.jpg',
    'latitud': '28.407968',
    'longitud': '-106.867322',
    'distancia': '4.8 km',
  },
  {
    'nombre': 'Farmacias Similares',
    'imagePath': 'image/MapPin.jpg',
    'latitud': '28.416148',
    'longitud': '-106.848536',
    'distancia': '7.4 km',
  },
];
