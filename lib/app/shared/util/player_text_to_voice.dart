import 'package:flutter_tts/flutter_tts.dart';

import 'package:projeto_csa_app/app/shared/util/player_audio_local.dart';

class PlayerTextToVoice implements PlayerAudioLocal {
  FlutterTts flutterTts;
  PlayerTextToVoice({
    required this.flutterTts,
  });

  @override
  Future<void> escolherAudio(String path) async {}

  @override
  Future<void> playerAudio(String path) async {
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.speak(path);
  }
  
}
