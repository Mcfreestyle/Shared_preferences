import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion9/widgets/index.dart';
import 'package:sesion9/preferences/preferences.dart';
import 'package:sesion9/providers/provider_theme.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  final imgController = TextEditingController(text: Preferences.img);
  final nameController = TextEditingController(text: Preferences.name);
  final lastNameController = TextEditingController(text: Preferences.lastName);
  final cityController = TextEditingController(text: Preferences.city);
  final countryController = TextEditingController(text: Preferences.country);

  @override
  Widget build(BuildContext context) {
    save() {
      Preferences.img = imgController.text;
      Preferences.name = nameController.text;
      Preferences.lastName = lastNameController.text;
      Preferences.city = cityController.text;
      Preferences.country = countryController.text;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text('Configuration'),
          centerTitle: true,
          actions: [
            Switch.adaptive(
              value: Preferences.theme,
              onChanged: (value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ProviderTheme>(context, listen: false);
                value ? themeP.setDark() : themeP.setLight();
                setState(() {});
              },
            )
          ]),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                controller: imgController,
                keyboardType: TextInputType.text,
                hintText: 'Imagen',
                prefixIcon: const Icon(Icons.photo),
              ),
              MyTextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                hintText: 'Nombre',
                prefixIcon: const Icon(Icons.person),
              ),
              MyTextField(
                controller: lastNameController,
                keyboardType: TextInputType.name,
                hintText: 'Apellido',
                prefixIcon: const Icon(Icons.person),
              ),
              MyTextField(
                controller: cityController,
                keyboardType: TextInputType.name,
                hintText: 'Ciudad',
                prefixIcon: const Icon(Icons.location_city),
              ),
              MyTextField(
                controller: countryController,
                keyboardType: TextInputType.name,
                hintText: 'Pais',
                prefixIcon: const Icon(Icons.location_on),
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
              SizedBox(
                height: 50,
                width: 200,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.green,
                    child: const Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      save();
                      setState(() {});
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
