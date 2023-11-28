import 'package:flutter/material.dart';
import 'package:my_app/pages/my_game_page.dart';
import 'package:flutter/services.dart';
import 'package:my_app/pages/login.page.dart';



// Define a custom Form widget.
class MyRegisterForm extends StatefulWidget {
  const MyRegisterForm({super.key});

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
            )
          ),
          body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Image.asset(
                  'assets/tictactoe_icon.png',
                  width: 75,
                  height: 75,
                ), // Caminho para a imagem no diretório de assets
              ),
              const Text(
                'Cadastro',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                    controller: _apelidoController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextFormField(
                    //autofocus: true,
                    focusNode: fieldTwo,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                                  duration: Duration(seconds: 3), // Tempo de exibição do SnackBar
                                ),
                              );

                              // Aguarda 3 segundos antes de navegar para a tela de login
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const MyCustomForm(),
                                  ),
                                );
                              });
                            }
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
                  )
                  ),
              ),    
            ],
          ),
      )
      ),
      )
    );
  }
}
