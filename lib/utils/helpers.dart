import 'dart:math';

class Helpers {
  static String generateChannelName() {
    const String characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    String uniqueCode = '';

    for (int i = 0; i < 10; i++) {
      int randomIndex = random.nextInt(characters.length);
      uniqueCode += characters[randomIndex];
    }

    return uniqueCode;
  }
}
