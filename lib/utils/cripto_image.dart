import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
class CriptoImage {

  static final initVector = IV.fromSecureRandom(16);
  static Encrypted encrypt(List<int> imageBytes, Key encriptKey){

    var encrypt = Encrypter(new AES(encriptKey));

    return encrypt.encryptBytes(imageBytes, iv: initVector);
  }

  static Uint8List decrypt(Encrypted encryptedImage, Key decriptKey){

    final decripter = Encrypter(new AES(decriptKey));

    return Uint8List.fromList(decripter.decryptBytes(encryptedImage, iv: initVector));

  }
}