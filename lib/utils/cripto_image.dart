import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

class CriptoImage {
  static final _initVector = IV.fromSecureRandom(16);
  static Encrypted encrypt(List<int> imageBytes, Key encriptKey) {
    var encrypt = Encrypter(new AES(encriptKey, padding: null));

    return encrypt.encryptBytes(imageBytes, iv: _initVector);
  }

  static Uint8List decrypt(Encrypted encryptedImage, Key decriptKey) {
    final decripter = Encrypter(new AES(decriptKey, padding: null));

    return Uint8List.fromList(
        decripter.decryptBytes(encryptedImage, iv: _initVector));
  }
}
