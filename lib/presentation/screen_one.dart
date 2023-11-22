import 'package:drawer/presentation/screen_two.dart';
import 'package:drawer/side_menu.dart';
import 'package:flutter/material.dart';
class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  bool _isLoading = false;

  void _navigateToScreenTwo() {
    setState(() {
      _isLoading = true; 
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ScreenTwo()),
      );
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
      drawer: const SideMenu(),
    );
  }
}