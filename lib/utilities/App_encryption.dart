import 'package:encrypt/encrypt.dart';

class Encryption {
  static String decrypt(String keyString, String encryptedString) {
    final encryptedData = Encrypted.fromBase64(encryptedString);
    final key = Key.fromUtf8(keyString);
    final encryptor = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    return encryptor.decrypt(encryptedData, iv: initVector);
  }

  static Encrypted encrypt(String keyString, String plainText) {
    final key = Key.fromUtf8(keyString);
    final encryptor = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = encryptor.encrypt(plainText, iv: initVector);
    return encryptedData;
  }
}
