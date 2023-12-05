//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:my_app/pages/register.page.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adicionar imagem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPhotoSelector(title: 'Adicionar Imagem'),
    );
  }
}

class MyPhotoSelector extends StatefulWidget {
  const MyPhotoSelector({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPhotoSelector> createState() => _MyPhotoSelector();
}

class _MyPhotoSelector extends State<MyPhotoSelector> {
  File? image;
  //final FirebaseStorage storage = FirebaseStorage.instance;
  bool uploading = false;
  double total = 0;

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    //UploadTask task = await upload(image.path);
    return image;
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);
      //UploadTask task = await upload(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      //UploadTask task = await upload(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> navigateToRegisterPage() async {
    if (image != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyRegisterForm(imagem: image!),
        ),
      );
    } else {
      // Trate o caso em que nenhuma imagem foi selecionada
      print("Nenhuma imagem selecionada.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: uploading
                ? Text('${total.round()}% enviado')
                : const Text("           Adicionar Imagem"),
            actions: [
              uploading
                  ? const Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ]),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(
                          10), // Ajusta o espaçamento interno
                      minimumSize: const Size(
                          232, 40), // Define a altura mínima e largura do botão
                    ),
                    child: const Text(
                      'Galeria',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              //const SizedBox(height: 20),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      pickImageC();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(
                          10), // Ajusta o espaçamento interno
                      minimumSize: const Size(
                          232, 40), // Define a altura mínima e largura do botão
                    ),
                    child: const Text(
                      'Câmera',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: image != null
                      ? Image.file(
                          image!,
                          width: 300.0,
                          height: 300.0,
                          fit: BoxFit
                              .cover, // You can adjust the BoxFit property based on your needs
                        )
                      : const Text("                   Imagem não selecionada"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: image != null
                    ? ElevatedButton(
                        onPressed: navigateToRegisterPage,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          minimumSize: const Size(232, 40),
                        ),
                        child: const Text(
                          'Escolher esta imagem',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : const Text(""),
              ),
            ],
          ),
        ));
  }
}
