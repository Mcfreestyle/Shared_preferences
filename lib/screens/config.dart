import 'package:flutter/material.dart';
import 'package:sesion9/widgets/index.dart';
import 'package:sesion9/preferences/preferences.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                initialValue: Preferences.img,
                keyboardType: TextInputType.text,
                hintText: 'Imagen',
                prefixIcon: const Icon(Icons.photo),
                onChanged: (value) {
                  Preferences.img = value;
                },
              ),
              MyTextField(
                initialValue: Preferences.name,
                keyboardType: TextInputType.name,
                hintText: 'Nombre',
                prefixIcon: const Icon(Icons.person),
                onChanged: (value) {
                  Preferences.name = value;
                },
              ),
              MyTextField(
                initialValue: Preferences.lastName,
                keyboardType: TextInputType.name,
                hintText: 'Apellido',
                prefixIcon: const Icon(Icons.person),
                onChanged: (value) {
                  Preferences.lastName = value;
                },
              ),
              MyTextField(
                initialValue: Preferences.city,
                keyboardType: TextInputType.name,
                hintText: 'Ciudad',
                prefixIcon: const Icon(Icons.location_city),
                onChanged: (value) {
                  Preferences.city = value;
                },
              ),
              MyTextField(
                initialValue: Preferences.country,
                keyboardType: TextInputType.name,
                hintText: 'Pais',
                prefixIcon: const Icon(Icons.location_on),
                onChanged: (value) {
                  Preferences.country = value;
                },
              ),
              RadioListTile(
                activeColor: Colors.green,
                value: 1,
                groupValue: Preferences.gender,
                title: const Text('Masculino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              RadioListTile(
                activeColor: Colors.green,
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Femenino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
