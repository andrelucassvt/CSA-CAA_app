import 'package:audioplayers/audioplayers.dart';
import 'package:projeto_csa_app/app/shared/interface/player_audio_local.dart';

class PlayerAudioLocalImpl implements PlayerAudioLocal{
  AudioPlayer? audioPlayer;
  AudioCache? audioCache;

  @override
  Future<void> playerAudio(String path) async {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    try {
      await audioCache!.play(path,volume: 100);
    } catch (e) {
      rethrow;
    }
  }
}