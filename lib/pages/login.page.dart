import 'package:flutter/material.dart';
import 'package:my_app/pages/my_game_page.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  late FocusNode myFocusNode;
  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next step.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(
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
                  autofocus: true,
                  focusNode: fieldOne,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    labelText: 'E-mail',
                  ),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(fieldTwo);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                //autofocus: true,
                focusNode: fieldTwo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  labelText: 'Senha',
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                    padding: const EdgeInsets.all(
                        10), // Ajusta o espaçamento interno
                    minimumSize: const Size(
                        120, 30), // Define a altura mínima e largura do botão
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Função a ser executada quando o botão for pressionado
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(
                        10), // Ajusta o espaçamento interno
                    minimumSize: const Size(
                        90, 30), // Define a altura mínima e largura do botão
                  ),
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
