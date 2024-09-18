import 'package:appadsgp1/view/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logotipo
              Image.asset(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  "assets/logotipo_firma.png"),
              //email
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email obrigatório";
                  }
                  return null;
                },
                maxLength: 70,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "Digite seu email"),
              ),
              SizedBox(
                height: 15,
              ),
              //senha
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Senha obrigatória";
                  }
                  return null;
                },
                maxLength: 20,
                decoration: const InputDecoration(hintText: "Digite sua senha"),
              ),
              SizedBox(
                height: 15,
              ),
              //botão entrar
              SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage()
                          )
                        );
                    }
                    
                  },
                  child: const Text("Entrar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
