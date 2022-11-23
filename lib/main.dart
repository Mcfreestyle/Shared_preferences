import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion9/preferences/preferences.dart';
import 'package:sesion9/providers/provider_login.dart';
import 'package:sesion9/providers/provider_theme.dart';
import 'package:sesion9/routes/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderTheme(isDarkMode: Preferences.theme),
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderLogin(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ProviderTheme>(context).currentTheme,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rLOGIN,
      // home: const Home(),
      // home: const Login(),
    );
  }
}
