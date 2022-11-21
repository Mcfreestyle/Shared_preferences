import 'package:flutter/material.dart';
import 'package:sesion9/widgets/index.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text(
          'WELCOME',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
