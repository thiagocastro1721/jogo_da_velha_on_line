//import '/flutter_flow/flutter_flow_theme.dart';
//import '/flutter_flow/flutter_flow_util.dart';
//import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/my_game_page.dart';
//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';

//import 'home_page_model.dart';
//export 'home_page_model.dart';


// Define a custom Form widget.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  //late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // Fill this out in the next step.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          //backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: const Align(
            alignment:  AlignmentDirectional(0.00, 0.00),
            child: Text(
              'Jogo da Velha',
              style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 18,
            ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(1.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          //'https://picsum.photos/seed/417/600',
                          'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcR9TjudsqhvW6GSYSaoNHPEpjPujSr-HcCe-GliFPpIcAZhDA7dsuGNewXxamoIhwjH',
                          width: 300,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                         Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding:
                                 EdgeInsetsDirectional.fromSTEB(77, 15, 0, 10),
                            child: Text(
                              'Apelido: ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                         Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding:
                                 EdgeInsetsDirectional.fromSTEB(10, 15, 0, 10),
                            child: Text(
                              'Thiago',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                     Padding(
                      padding:  EdgeInsetsDirectional.fromSTEB(54, 0, 0, 10),
                      child: Text(
                        'Pontuação:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                      child: Text(
                        ' 1600',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Função a ser executada quando o botão for pressionado
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: ((context) => const MyGame())
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
                    'Jogar',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ),
              
                const Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding:
                               EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: Text(
                              'TOP 3 melhores jogadores',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 10),
                      child: Text(
                        'Primeiro Lugar:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                      child: Text(
                        'ThiagoCastro',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                            ),
                    ),
                     Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                      child: Text(
                        '1600',
                        style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                     Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 10),
                      child: Text(
                        'Segundo Lugar:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                      child: Text(
                        'FabyMoreira',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                      child: Text(
                        '1500',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'Terceiro Lugar:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'SamiraCastro',
                       style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '1400',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      ),
                    ),
                  ],
                ),
              ]),
          ),
        ),
      ),
      );
  }
}
