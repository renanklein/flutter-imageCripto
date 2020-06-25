# image_cripto

This is just a simple library for training purpose that can encrypt/decrypt an image using AES algorithm

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
