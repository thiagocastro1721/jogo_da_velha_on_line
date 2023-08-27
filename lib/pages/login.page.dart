import 'package:flutter/material.dart';
import 'package:my_app/pages/my_game_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Image.asset(
            'assets/tictactoe_icon.png',
            width: 150,
            height: 150,
          ), // Caminho para a imagem no diretório de assets
        ),
        const Text(
          'Jogo da Velha',
          style: TextStyle(fontSize: 16),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'E-mail',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Senha',
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Função a ser executada quando o botão for pressionado
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((context) => const MyGame()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.all(10), // Ajusta o espaçamento interno
                minimumSize: const Size(
                    120, 30), // Define a altura mínima e largura do botão
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(fontSize: 18),
              ),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Função a ser executada quando o botão for pressionado
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.all(10), // Ajusta o espaçamento interno
                minimumSize: const Size(
                    90, 30), // Define a altura mínima e largura do botão
              ),
              child: const Text(
                'Cadastre-se',
                style: TextStyle(fontSize: 18),
              ),
            )),
      ],
    );
  }
}
