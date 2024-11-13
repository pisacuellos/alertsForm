import 'package:flutter/material.dart';

// Función principal que ejecuta la aplicación
void main() => runApp(const MyApp());

// Definición de la clase principal de la app, extendiendo StatelessWidget ya que no requiere estado mutable.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp establece el título y define la pantalla principal.
    return const MaterialApp(
      title: 'Recuperar el valor d\'un camp de text',
      home: MyCustomForm(),
    );
  }
}

// Definición de un widget con estado para manejar interacciones.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Estado asociado a MyCustomForm.
class _MyCustomFormState extends State<MyCustomForm> {

  @override
  void dispose() {
    // Libera los recursos cuando el widget se destruye.
    super.dispose();
  }

  // Muestra un diálogo simple.
  void showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Retorna un SimpleDialog con un texto dentro de un Padding.
        return SimpleDialog(
          title: const Text('SimpleDialog'),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('hola prova 2'),
            ),
          ],
        );
      },
    );
  }

  // Muestra un cuadro de diálogo de alerta.
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Retorna un AlertDialog con un botón "OK" que cierra el diálogo.
        return AlertDialog(
          title: const Text('AlertDialog'),
          content: const Text('hola prova 3'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Muestra un SnackBar en la parte inferior de la pantalla.
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('hola prova 4'),
      action: SnackBarAction(
        label: 'Tr',
        onPressed: () {
          // Aquí puedes agregar la acción que desees.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Muestra un modal BottomSheet personalizado.
  void showCustomModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        // Contenedor que define la apariencia y el contenido del BottomSheet.
        return Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Tancar BottomSheet'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold crea la estructura principal de la pantalla.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showSimpleDialog(context),
              child: const Text('Mostrar SimpleDialog'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showAlertDialog(context),
              child: const Text('Mostrar AlertDialog amb un botó'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showSnackBar(context),
              child: const Text('Mostrar SnackBar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showCustomModalBottomSheet(context),
              child: const Text('Mostrar Modal BottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
