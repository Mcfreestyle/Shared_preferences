import 'package:flutter/material.dart';
import 'package:sesion9/widgets/index.dart';
import 'package:sesion9/preferences/preferences.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2016/06/02/02/31/background-1430103_960_720.png'),
                ),
              ),
              child: Column(
                children: [
                  (Preferences.img == '')
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.green,
                          ),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(Preferences.img),
                        ),
                  Text(
                    '${Preferences.name} ${Preferences.lastName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    'Software developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 300,
                child: ListView(
                  children: ListTile.divideTiles(context: context, tiles: [
                    ListTile(
                      leading: const Icon(Icons.location_city),
                      title: const Text('Ciudad'),
                      subtitle: Text(Preferences.city),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text('Pais'),
                      subtitle: Text(Preferences.country),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('Genero'),
                      subtitle: (Preferences.gender == 1)
                          ? const Text('Masculino')
                          : const Text('Femenino'),
                    ),
                  ]).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
