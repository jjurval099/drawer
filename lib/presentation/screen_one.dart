import 'package:drawer/presentation/screen_two.dart';
import 'package:drawer/menu/side_menu.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}


class _ScreenOneState extends State<ScreenOne> {
  bool _isLoading = false;
  bool _isDrawerClosed = true;

  void _navigateToScreenTwo() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ScreenTwo()),
      ).then((_) {
        // Espera a que se complete la navegación y obtiene el estado del drawer
        Future.delayed(Duration.zero, () {
          setState(() {
            _isDrawerClosed = ModalRoute.of(context)?.isFirst ?? true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _navigateToScreenTwo,
                child: const Text('Ir a la Segunda Pantalla'),
              ),
      ),
      drawer: SideMenu(
        onDrawerClosed: (bool isClosed) {
          setState(() {
            _isDrawerClosed = isClosed;
          });
        },
      ),
    );
  }
}
