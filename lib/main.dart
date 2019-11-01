import 'package:encrypt/encrypt.dart' as encryptLib;
import 'package:flutter/material.dart';
import 'package:image_cripto/utils/cripto_image.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App de teste criptografia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        home: ImageCripto());
  }
}

class ImageCripto extends StatefulWidget {
  List<int> _imageBytes;
  final _criptographKey = encryptLib.Key.fromSecureRandom(16);
  encryptLib.Encrypted _encryptedImage;
  @override
  _ImageCriptoState createState() => _ImageCriptoState();
}

class _ImageCriptoState extends State<ImageCripto> {
  bool hasImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Criptografia de imagens"),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Container(child: hasImage ? showImage() : chooseImage())));
  }

  Future getImageBytes() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      this.widget._imageBytes = image.readAsBytesSync();
    });

    setState(() {
      this.hasImage = true;
    });
  }

  void setEncriptedImage(encryptLib.Encrypted encrypted) {
    this.widget._encryptedImage = encrypted;
  }

  Widget chooseImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Escolha uma imagem ...",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor)),
        SizedBox(
          height: 100.0,
        ),
        RaisedButton(
          onPressed: getImageBytes,
          color: Theme.of(context).primaryColor,
          child: Text(
            "Escolher imagem",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  Widget showImage() {
    setEncriptedImage(CriptoImage.encrypt(
        this.widget._imageBytes, this.widget._criptographKey));
    return Center(
      child: ListView(
        children: <Widget>[
          Text(
            "Imagem descriptografada :",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Image.memory(CriptoImage.decrypt(
                this.widget._encryptedImage, this.widget._criptographKey)),
            height: 150.0,
            width: 150.0,
          ),
        ],
      ),
    );
  }
}
