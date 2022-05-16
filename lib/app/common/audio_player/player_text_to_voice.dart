import 'package:flutter_tts/flutter_tts.dart';


class PlayerTextToVoice {

  static Future<void> playerAudio(String path) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.speak(path);
  }
  
}
