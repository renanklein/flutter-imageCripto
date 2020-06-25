# Changelog



# About

This is just a simple library for training purpose that can encrypt/decrypt an image using AES algorithm

## [v1.1.0] (https://github.com/renanklein/flutter-imageCripto/releases/tag/v1.1.0) - 2020-06-25

## [v1.0](https://github.com/renanklein/flutter-imageCripto/releases/tag/v1.0) - 2020-06-24

# How to use

Just import the package and use the static methods, for example:

`````dart
 Widget showImage() {
    setEncriptedImage(CriptoImage.encrypt(
        this._imageBytes, this.widget._criptographKey));
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
                this._encryptedImage, this.widget._criptographKey)),
            height: 150.0,
            width: 150.0,
          ),
        ],
      ),
    );
  }
````


