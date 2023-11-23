import 'package:drawer/presentation/screen_one.dart';
import 'package:flutter/material.dart';


class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: const Center(
        child: Text('Esta es la Segunda Pantalla'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bool isDrawerClosed = Scaffold.of(context).isDrawerOpen;
          Navigator.pop(context); // Cierra ScreenTwo

          // Verifica si el drawer está cerrado y decide si volver a ScreenOne
          if (!isDrawerClosed) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenOne()),
            );
          }
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
