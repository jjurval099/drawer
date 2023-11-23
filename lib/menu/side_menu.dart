import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required Null Function(bool isClosed) onDrawerClosed});

  State<SideMenu> createState() => _SideMenuState();  
}

class _SideMenuState extends State<SideMenu>{

  int navDrawerIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return  NavigationDrawer(
      children: [
        NavigationDrawerDestination(
          icon: const Icon(Icons.add),
          label: const Text('One Screen')
        ),

        NavigationDrawerDestination(
          icon: const Icon(Icons.add_shopping_cart_rounded),
          label: const Text('Second Screen')
        )
      ]
    );
  }
}