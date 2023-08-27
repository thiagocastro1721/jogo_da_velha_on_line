import 'package:flutter/material.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);
  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  List<List<bool>> botaoVencedor = [
    [false, false, false],
    [false, false, false],
    [false, false, false],
  ];
  List grade = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  int jogadas = 0;
  String jogadorAtual = 'X';
  String textoInformativo = '';
  bool jogoIniciado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AbsorbPointer(
            absorbing: !jogoIniciado,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        "Jogo da Velha",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                       ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myButton(linha: 0, coluna: 0),
                    myButton(linha: 0, coluna: 1),
                    myButton(linha: 0, coluna: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myButton(linha: 1, coluna: 0),
                    myButton(linha: 1, coluna: 1),
                    myButton(linha: 1, coluna: 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myButton(linha: 2, coluna: 0),
                    myButton(linha: 2, coluna: 1),
                    myButton(linha: 2, coluna: 2),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  textoInformativo,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              AbsorbPointer(
                  absorbing: jogoIniciado,
                  child: Opacity(
                      opacity: jogoIniciado ? 0 : 1, child: btInicio())),
            ],
          ),
        ],
      ),
    );
  }

  Widget myButton({required int linha, required int coluna}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            clique(coluna: coluna, linha: linha);
          });
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 100),
          backgroundColor: botaoVencedor[linha][coluna]
              ? Colors.red // Cor vermelha para os botões vencedores
              : const Color.fromARGB(255, 24, 108, 177), // Cor padrão
        ),
        child: Text(
          grade[linha][coluna],
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }

  Widget btInicio() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            botaoVencedor = [
              [false, false, false],
              [false, false, false],
              [false, false, false],
            ];
            jogoIniciado = true;
            jogadas = 0;
            grade = List.generate(3, (i) => List.filled(3, ''));
            jogadorAtual = 'X';
            textoInformativo = '$jogadorAtual é a sua vez.';
          });
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 50), backgroundColor: Colors.amber),
        child: Text(
          jogadas > 0 ? "jogar novamente" : "Bora Jogar!",
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  //logica do clique
  void clique({required int linha, required int coluna}) {
    jogadas++;
    grade[linha][coluna] = jogadorAtual;
    bool existeVencedor =
        verificaVencedor(jogador: jogadorAtual, linha: linha, coluna: coluna);

    if (existeVencedor) {
      textoInformativo = '$jogadorAtual Venceu!';
      jogoIniciado = false;
    } else if (existeVencedor == false && jogadas == 9) {
      textoInformativo = 'Empate! Deu Velha.';
      jogoIniciado = false;
    } else {
      if (jogadorAtual == 'X') {
        jogadorAtual = 'O';
      } else {
        jogadorAtual = 'X';
      }
      textoInformativo = '$jogadorAtual é sua vez.';
    }
  }

  bool verificaVencedor(
      {required String jogador, required int linha, required int coluna}) {
    bool venceu = true;
    //verifica linha
    for (int i = 0; i < 3; i++) {
      if (grade[linha][i] != jogador) {
        venceu = false;
        break;
      }
    }

    if (venceu == true) {
      botaoVencedor[linha][0] = true;
      botaoVencedor[linha][1] = true;
      botaoVencedor[linha][2] = true;
      return venceu;
    }

    venceu = true;

    //verifica coluna
    for (int j = 0; j < 3; j++) {
      if (grade[j][coluna] != jogador) {
        venceu = false;
        break;
      }
    }

    if (venceu == true) {
      botaoVencedor[0][coluna] = true;
      botaoVencedor[1][coluna] = true;
      botaoVencedor[2][coluna] = true;
      return venceu;
    }

    //verifica diagonal
    if (venceu == false) {
      if (grade[1][1] == jogador) {
        if (grade[0][0] == jogador && grade[2][2] == jogador) {
          venceu = true;
          botaoVencedor[0][0] = true;
          botaoVencedor[1][1] = true;
          botaoVencedor[2][2] = true;
        } else if (grade[0][2] == jogador && grade[2][0] == jogador) {
          venceu = true;
          botaoVencedor[0][2] = true;
          botaoVencedor[1][1] = true;
          botaoVencedor[2][0] = true;
        }
      }
    }

    return venceu;
  }
}
