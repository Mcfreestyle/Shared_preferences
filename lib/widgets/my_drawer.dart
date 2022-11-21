import 'package:flutter/material.dart';
import 'package:sesion9/preferences/preferences.dart';
import 'package:sesion9/screens/index.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/06/02/02/31/background-1430103_960_720.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (Preferences.img == '')
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.green,
                          ),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(Preferences.img),
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${Preferences.name} ${Preferences.lastName}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Software developer',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuration'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Config()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
          ),
        ],
      ),
    );
  }
}
