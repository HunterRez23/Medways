import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'PantallaPrincipal.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get('Nombre') == user.text) {
            print('Usuario encontrado');
            if (cursor.get('Password') == pass.text) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PantallaPrincipal()),
              );
            }
          }
        }
      } else {
        print('No hay documentos en la coleccion');
      }
    } catch (e) {
      print("ERROR..." + e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingrese Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Container(
                  child: const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('image/MedWays.jpeg'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Agregar coma después de borderRadius
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  labelText: 'Usuario',
                  hintText: 'Ingresa su usuario',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Agregar coma después de borderRadius
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, right: 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Ingresado...');

                    validarDatos();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFF364496), // Color de fondo del botón
                    foregroundColor: Colors.white, // Color del texto del botón
                    minimumSize:
                        Size.fromHeight(50), // Aumenta la altura del botón
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical:
                            12), // Increase the space around the button's content

                    child: Text('Ingresar'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
