import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);
  @override
  State<MyGame> createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  //Controlador de tela de Loading
  bool isLoading = false;

  //Contador de partidas
  int contadorDePartidas = 0;

  List<Widget> marcadorDePontosP1 = List.generate(
    5,
    (index) => Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius:
              BorderRadius.circular(8.0), // Raio de canto de tamanho 8
        ),
      ),
    ),
  );

  List<Widget> marcadorDePontosP2 = List.generate(
    5,
    (index) => Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius:
              BorderRadius.circular(8.0), // Raio de canto de tamanho 8
        ),
      ),
    ),
  );

  Duration duration = Duration(minutes: 1);
  Timer? timer;

  Duration secondaryDuration = Duration(minutes: 1);
  Timer? secondaryTimer;

  Duration defaultDuration = Duration(seconds: 60);

  bool isPaused = false;
  bool isSecondaryPaused = false;

  Icon? iconeVitoria;

  void incrementarIconeP1() {
    setState(() {
      iconeVitoria = Icon(Icons.emoji_events, color: Colors.black);

      // Criar um Container com fundo azul e bordas arredondadas envolvendo o ícone
      Widget iconeComFundoAzul = Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
                BorderRadius.circular(8.0), // Raio de canto de tamanho 8
          ),
          child: iconeVitoria,
        ),
      );

      // Adicionar o ícone envolvido ao marcadorDePontosP1
      marcadorDePontosP1.insert(contadorDePartidas, iconeComFundoAzul);
      marcadorDePontosP1.removeLast();
    });
  }

  void incrementarIconeDerrotaP1() {
    setState(() {
      iconeVitoria = Icon(Icons.close, color: Colors.black);

      // Criar um Container com fundo azul e bordas arredondadas envolvendo o ícone
      Widget iconeComFundoAzul = Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
                BorderRadius.circular(8.0), // Raio de canto de tamanho 8
          ),
          child: iconeVitoria,
        ),
      );

      // Adicionar o ícone envolvido ao marcadorDePontosP1
      marcadorDePontosP1.insert(contadorDePartidas, iconeComFundoAzul);
      marcadorDePontosP1.removeLast();
    });
  }

  void incrementarIconeP2() {
    setState(() {
      iconeVitoria = Icon(Icons.emoji_events, color: Colors.black);

      // Criar um Container com fundo azul e bordas arredondadas envolvendo o ícone
      Widget iconeComFundoAzul = Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
                BorderRadius.circular(8.0), // Raio de canto de tamanho 8
          ),
          child: iconeVitoria,
        ),
      );
      //
      // Adicionar o ícone envolvido ao marcadorDePontosP1
      marcadorDePontosP2.insert(contadorDePartidas, iconeComFundoAzul);
      marcadorDePontosP2.removeLast();
    });
  }

  void incrementarIconeDerrotaP2() {
    setState(() {
      iconeVitoria = Icon(Icons.close, color: Colors.black);

      // Criar um Container com fundo azul e bordas arredondadas envolvendo o ícone
      Widget iconeComFundoAzul = Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
                BorderRadius.circular(8.0), // Raio de canto de tamanho 8
          ),
          child: iconeVitoria,
        ),
      );

      // Adicionar o ícone envolvido ao marcadorDePontosP1
      marcadorDePontosP2.insert(contadorDePartidas, iconeComFundoAzul);
      marcadorDePontosP2.removeLast();
    });
  }

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

  //@override
  //void initState() {
  //  super.initState();
  //  startTimer();
  //}

  void addTime() {
    final addSeconds = -1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      duration = Duration(seconds: seconds);
      // Adiciona a lógica para verificar se o tempo chegou a 00
      if (duration.inSeconds == 0) {
        textoInformativo = 'Tempo esgotado! Jogo encerrado.';
        jogoIniciado = false;
        timer?.cancel();
      }
    });
  }

  void addSecondaryTime() {
    final addSeconds = -1;
    setState(() {
      final seconds = secondaryDuration.inSeconds + addSeconds;
      secondaryDuration = Duration(seconds: seconds);

      if (secondaryDuration.inSeconds == 0) {
        // Lógica para o segundo cronômetro
        textoInformativo = 'Tempo esgotado! Jogo encerrado.';
        jogoIniciado = false;
        secondaryTimer?.cancel();
      }
    });
  }

  void startTimer({Duration? duration}) {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    setState(() {
      duration = Duration(seconds: 60);
    });
  }

  void startSecondaryTimer({Duration? secondaryDuration}) {
    secondaryTimer =
        Timer.periodic(Duration(seconds: 1), (_) => addSecondaryTime());
    setState(() {
      secondaryDuration = Duration(seconds: 60);
    });
  }

  void pauseGame() {
    setState(() {
      isPaused = true;
      timer?.cancel();
    });
  }

  void resumeGame() {
    setState(() {
      isPaused = false;
      startTimer();
    });
  }

  void pauseSecondaryGame() {
    setState(() {
      isSecondaryPaused = true;
      secondaryTimer?.cancel();
    });
  }

  void resumeSecondaryGame() {
    setState(() {
      isSecondaryPaused = false;
      startSecondaryTimer();
    });
  }

  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingPage()
      : Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 21,
                    bottom: 2,
                    right: 2,
                    left: 2), // Adiciona padding superior de 21
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/player2.png',
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Text(
                        'WWWWWWWWWWWW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        '1500',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 15, right: 2),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ...marcadorDePontosP2,
                    Spacer(),
                    buildSecondaryTime(),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AbsorbPointer(
                    absorbing: !jogoIniciado,
                    child: Column(
                      children: [
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
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          textoInformativo,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AbsorbPointer(
                        absorbing: jogoIniciado,
                        child: Opacity(
                          opacity: jogoIniciado ? 0 : 1,
                          child: btInicio(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //Padding(
              //  padding: const EdgeInsets.only(left:130),
              //  child: Row(
              //    children: [
              //      buildTime(),
              //    ],
              //  ),
              //),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 0, right: 2),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ...marcadorDePontosP1,
                    Spacer(),
                    buildTime(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    right: 2,
                    left: 2), // Adiciona padding inferior de 30
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/player1.png',
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        'WWWWWWWWWWWW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        '1600',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

  Widget myButton({required int linha, required int coluna}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            clique(coluna: coluna, linha: linha);
          });

          // Adiciona uma pequena vibração ao tocar no botão
          _vibrateShort();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: botaoVencedor[linha][coluna]
              ? Colors.red // Cor vermelha para os botões vencedores
              : const Color.fromARGB(255, 24, 108, 177), // Cor padrão
        ),
        child: Text(
          grade[linha][coluna],
          style: const TextStyle(fontSize: 50, color: Colors.black),
        ),
      ),
    );
  }

  void _vibrateShort() async {
    // Verifica se o dispositivo suporta vibração
    bool hasVibrator = await Vibration.hasVibrator() ?? false;

    // Verifica se o dispositivo suporta vibração antes de vibrar
    if (hasVibrator) {
      // Faz o celular vibrar por um curto período (ajuste conforme necessário)
      Vibration.vibrate(duration: 100);
    }
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
            startTimer();
          });
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50),
          backgroundColor: Colors.amber,
        ),
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
      Vibration.vibrate();
      textoInformativo = '$jogadorAtual Venceu!';
      if (jogadorAtual == 'X') {
        incrementarIconeP1();
        incrementarIconeDerrotaP2();
        contadorDePartidas++;
      } else {
        incrementarIconeP2();
        incrementarIconeDerrotaP1();
        contadorDePartidas++;
      }
      jogoIniciado = false;
    } else if (existeVencedor == false && jogadas == 9) {
      textoInformativo = 'Empate! Deu Velha.';
      jogoIniciado = false;
      incrementarIconeDerrotaP1();
      incrementarIconeDerrotaP2();
      contadorDePartidas++;
    } else {
      if (jogadorAtual == 'X') {
        jogadorAtual = 'O';
        pauseGame();
        if (jogadas == 1) {
          startSecondaryTimer();
        } else {
          resumeSecondaryGame();
        }
      } else {
        jogadorAtual = 'X';
        resumeGame();
        pauseSecondaryGame();
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

  Widget buildTime() {
    // 9 --> 09 and 11 --> 11
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Padding(
      padding: const EdgeInsets.only(
          left: 10, bottom: 2), // Adiciona padding inferior de 30
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimeCard(time: minutes, header: 'MINUTES'),
          const SizedBox(width: 2),
          buildTimeCard(time: seconds, header: 'SECONDS'),
        ],
      ),
    );
  }

  Widget buildSecondaryTime() {
    // 9 --> 09 and 11 --> 11
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(secondaryDuration.inMinutes.remainder(60));
    final seconds = twoDigits(secondaryDuration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: minutes, header: 'MINUTES'),
        const SizedBox(width: 2),
        buildTimeCard(time: seconds, header: 'SECONDS'),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        child: Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      );
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: const Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: 200, bottom: 71), // Adiciona padding inferior de 30
          child: Text(
            'Procurando jogador.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: SpinKitCubeGrid(
            size: 140,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
