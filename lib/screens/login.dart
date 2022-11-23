import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sesion9/providers/provider_login.dart';
import 'package:sesion9/routes/route.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<ProviderLogin>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_ucbyrun5.json'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: loginProvider.formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: myInputDecoration(
                          hintText: 'Correo',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.green,
                          ),
                        ),
                        onChanged: (value) => loginProvider.email = value,
                        validator: (value) {
                          String characters =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                          RegExp regExp = RegExp(characters);

                          return regExp.hasMatch(value ?? '')
                              ? null
                              : 'No es un correo valido';
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: myInputDecoration(
                          hintText: '*********',
                          prefixIcon: const Icon(
                            Icons.key_outlined,
                            color: Colors.green,
                          ),
                        ),
                        onChanged: (value) => loginProvider.password = value,
                        validator: (value) {
                          return (value != null && value.length >= 8)
                              ? null
                              : 'Debe tener minimo 8 caracteres';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.green,
                        // disabledColor: Colors.green,
                        onPressed: loginProvider.isLoading
                            ? null
                            : () async {
                                if (!loginProvider.isValidForm()) return;

                                loginProvider.isLoading = true;
                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );
                                loginProvider.isLoading = false;
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(
                                  context,
                                  MyRoutes.rHOME,
                                );
                              },
                        child: loginProvider.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'INGRESAR',
                                style: TextStyle(color: Colors.white),
                              ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration myInputDecoration({
    final String? hintText,
    final Widget? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
      // contentPadding: const
    );
  }
}
