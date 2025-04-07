import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login/Screens/Login.dart';

class Registro extends StatefulWidget {
  @override
  RegistroApp createState() => RegistroApp();
}

class RegistroApp extends State<Registro> {
  TextEditingController usuario = TextEditingController();
  TextEditingController edad = TextEditingController();
  TextEditingController pass = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registroUsurio() async {
    try {
      await firebase.collection('Users').doc().set({
        "Nombre": usuario.text,
        "Documento": edad.text,
        "Password": pass.text
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Login()),
      );
    } catch (e) {
      print('Error....' + e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de usuario'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
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
            padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
            child: TextField(
              controller: usuario,
              decoration: InputDecoration(
                  labelText: 'Nombre de Usuario',
                  hintText: 'Ingrese nombre',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: TextField(
              controller: edad,
              decoration: InputDecoration(
                labelText: 'Edad',
                hintText: 'Ingrese Documento',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: TextField(
              controller: pass,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingrese contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.purple),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF364496), // Color de fondo del botón
                foregroundColor: Colors.white, // Color del texto del botón
                minimumSize: Size(double.infinity,
                    50), // Establece el ancho a todo lo disponible y el alto a 50
              ),
              onPressed: () {
                registroUsurio();

                print("Registrado");

                pass.clear();

                usuario.clear();

                edad.clear();
              },
              child: const Text('Registrar'),
            ),
          )
        ],
      )),
    );
  }
}
