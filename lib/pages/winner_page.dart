import 'package:flutter/material.dart';
import 'package:my_app/pages/homepage.dart';


// Define a custom Form widget.
class MyWinnerPage extends StatefulWidget {
  const MyWinnerPage({super.key});
  @override
  State<MyWinnerPage> createState() => _MyWinnerPage();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyWinnerPage extends State<MyWinnerPage> {

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
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextFormField(
                //chamar teclado assim que a tela eh aberta
                //autofocus: true,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
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
                        builder: (context) => const MyHomePage(),
                        //builder: ((context) => const MyHomePage()),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(
                        10), // Ajusta o espaçamento interno
                    minimumSize: const Size(
                        90, 30), // Define a altura mínima e largura do botão
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
          ],
        ),
      )
      ),
    );
  }
}
