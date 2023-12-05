import 'dart:async';
import 'dart:io';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:mime/mime.dart';
//import 'package:video_player/video_player.dart';

//import 'dart:io';

//import 'package:flutter/material.dart';
//import 'package:my_app/pages/my_game_page.dart';
import 'package:flutter/services.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/pages/galeria_ou_camera.dart';
//import 'package:image_picker/image_picker.dart';

// Define a custom Form widget.
class MyRegisterForm extends StatefulWidget {
  final File? imagem;
  const MyRegisterForm({Key? key, required this.imagem}) : super(key: key);

  @override
  State<MyRegisterForm> createState() => _MyFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyFormState extends State<MyRegisterForm> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _apelidoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  //final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  //final TextEditingController _senhaConfirmController = TextEditingController();
  //final TextEditingController _emailConfirmController = TextEditingController();

  late FocusNode myFocusNode;
  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  FocusNode fieldThree = FocusNode();
  FocusNode fieldFour = FocusNode();
  FocusNode fieldFive = FocusNode();

  bool _showPassword = false;
  bool _confirmShowPassword = false;

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? imagem;

  @override
  void initState() {
    super.initState();
    imagem = widget.imagem;
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
          //key: _scaffoldKey,
          appBar: AppBar(
              title: const Text('Cadastro'),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: ((context) => const MyCustomForm()),
                      ),
                    );
                  },
                ),
              )),
          body: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 280,
                        height: 128,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 242, 242),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: -1,
                              blurRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  //builder: ((context) => const MyGame()),
                                  builder: ((context) =>
                                      const AddPhotoScreen()),
                                ),
                              );
                              //final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                              //if (pickedImage == null) {
                              //  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              //    content: Text('Imagem não selecionada!'),
                              //  ));
                              //} else {
                              //  setState(() {
                              //    image = pickedImage;
                              //  });
                              //}
                            },
                            child: SizedBox(
                              width: 312,
                              height: 128,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (imagem == null)
                                      const SizedBox(height: 40),
                                    if (imagem == null)
                                      const Icon(Icons.control_point),
                                    if (imagem != null)
                                      Container(
                                        width: 128,
                                        height: 128,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: imagem != null
                                              ? Image.file(
                                                  imagem!,
                                                  width: 128,
                                                  height: 128,
                                                  fit: BoxFit.cover,
                                                )
                                              : const Text("Imagem não disponível"),
                                        ),
                                      ),

                                    if (imagem == null)
                                      const Text(
                                        "Adicionar foto. Não obrigatório.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 67, 67, 67),
                                        ),
                                      ),
                                    if (imagem == null)
                                      const SizedBox(height: 44),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextFormField(
                      controller: _apelidoController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9]')),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Apelido obrigatório';
                        }
                        return null;
                      },
                      //autofocus: true,
                      focusNode: fieldOne,
                      maxLength: 12,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.account_circle_sharp,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        labelText: 'Apelido, apenas letras e números',
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldTwo);
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextFormField(
                      //autofocus: true,
                      focusNode: fieldTwo,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value)) {
                          return 'Digite um e-mail válido';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.alternate_email,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        labelText: 'E-mail',
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldThree);
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextFormField(
                      //autofocus: true,
                      focusNode: fieldThree,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != _emailController.text) {
                          return 'E-mail não confere';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.alternate_email,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        labelText: 'Confirme o e-mail',
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldFour);
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextFormField(
                      //autofocus: true,
                      focusNode: fieldFour,
                      controller: _senhaController,
                      obscureText: _showPassword == false ? true : false,
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
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _showPassword == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(fieldFive);
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextFormField(
                    //autofocus: true,
                    focusNode: fieldFive,
                    obscureText: _confirmShowPassword == false ? true : false,
                    validator: (value) {
                      if (value != _senhaController.text) {
                        return 'Senha não confere';
                      }
                      return null;
                    },
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
                      labelText: 'Confirme a senha',
                      suffixIcon: GestureDetector(
                        child: Icon(
                          _confirmShowPassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.blue,
                        ),
                        onTap: () {
                          setState(() {
                            _confirmShowPassword = !_confirmShowPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Builder(
                      builder: (context) => ElevatedButton(
                            onPressed: () {
                              // Função a ser executada quando o botão for pressionado
                              if (_formKey.currentState!.validate()) {
                                // Se a validação for bem-sucedida, você pode prosseguir com a lógica do cadastro
                                // Por exemplo, você pode acessar os valores usando _nomeController.text e _emailController.text

                                // Exibe um SnackBar informando que o cadastro foi bem-sucedido
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Cadastrado com sucesso!'),
                                    duration: Duration(
                                        seconds:
                                            3), // Tempo de exibição do SnackBar
                                  ),
                                );

                                // Aguarda 3 segundos antes de navegar para a tela de login
                                Future.delayed(const Duration(seconds: 3), () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MyCustomForm(),
                                    ),
                                  );
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(
                                  10), // Ajusta o espaçamento interno
                              minimumSize: const Size(90,
                                  30), // Define a altura mínima e largura do botão
                            ),
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(fontSize: 18),
                            ),
                          )),
                ),
              ],
            ),
          )),
        ));
  }

  Future getImage() async {
    final XFile? images = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = images;
    });
  }
}
