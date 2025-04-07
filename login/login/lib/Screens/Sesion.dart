import 'package:flutter/material.dart';
import 'package:login/Screens/PantallaPrincipal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SesionScreen extends StatefulWidget {
  @override
  _SesionScreenState createState() => _SesionScreenState();
}

class _SesionScreenState extends State<SesionScreen> {
  bool isLoginSelected = true; // variable iniciar/crear

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController edad = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  void validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      bool usuarioEncontrado = false;

      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (cursor.get('Nombre') == user.text &&
              cursor.get('Password') == pass.text) {
            print('Usuario encontrado');
            usuarioEncontrado = true;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaPrincipal()),
            );
            break; // Salir del bucle si el usuario es encontrado
          }
        }
      } else {
        print('No hay documentos en la colección');
      }

      if (!usuarioEncontrado) {
        // Mostrar mensaje de usuario o contraseña incorrectos
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Usuario o contraseña incorrecto'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("ERROR..." + e.toString());
    }
  }

  void registroUsuario(BuildContext context) async {
    try {
      if (user.text.isNotEmpty &&
          pass.text.isNotEmpty &&
          edad.text.isNotEmpty) {
        await firebase.collection('Users').doc().set({
          "Nombre": user.text,
          "Documento": edad.text,
          "Password": pass.text
        });

        // Mostrar mensaje de registro exitoso
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Éxito'),
              content: Text('Usuario registrado correctamente'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Navegar a MyApp una vez que se cierre el diálogo
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PantallaPrincipal()),
                    );
                  },
                  child: Text('Cerrar'),
                ),
              ],
            );
          },
        );

        // Limpiar los campos después del registro exitoso
        user.clear();
        pass.clear();
        edad.clear();
      } else {
        // Mostrar mensaje de error si algún campo está vacío
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Por favor, complete todos los campos'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print('Error en el registro de usuario: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0.0, -50.0),
                  child: Image.asset(
                    'image/med-wey.png',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSwitchButton('Iniciar sesión', isLoginSelected),
                      SizedBox(width: 2.0),
                      buildSwitchButton('Crear cuenta', !isLoginSelected),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                buildInputField('Correo', false, user),
                SizedBox(height: 10.0),
                buildInputField('Contraseña', true, pass),
                if (!isLoginSelected) SizedBox(height: 10.0),
                if (!isLoginSelected) buildInputField('Edad', true, edad),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 220.0,
                  height: 55.0,
                  child: ElevatedButton(
                    onPressed: () {
                      try {
                        if (isLoginSelected) {
                          validarDatos();
                        } else {
                          registroUsuario(context);
                        }
                      } catch (e) {
                        print('Error: $e');
                      }
                    },

                    child: Text(
                      'Continuar',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSwitchButton(String text, bool selected) {
    return InkWell(
      onTap: () {
        setState(() {
          isLoginSelected = text == 'Iniciar sesión';
          // Limpiar los controladores al cambiar entre secciones
          user.clear();
          pass.clear();
          edad.clear();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.transparent, width: 1.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: selected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
      String label, bool obscureText, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
