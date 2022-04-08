import 'package:audioplayers/audioplayers.dart';
import 'package:projeto_csa_app/app/shared/util/player_audio_local.dart';

class PlayerAudioLocalImpl implements PlayerAudioLocal{
  @override
  Future<void> playerAudio(String path) async {
    final audioPlayer = AudioPlayer();
    final audioCache = AudioCache(fixedPlayer: audioPlayer);
    try {
      await audioCache.play(path,volume: 100);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> escolherAudio(String path) async{
    print('========');
    print('path: $path');
    switch (path) {
      //Fase 1
      case 'chuveiro':
        playerAudio('audio/chuveiro.mp3');
        break;
      case 'banheiro':
        playerAudio('audio/banheiro.mp3');
        break;
      case 'escovar os dentes':
        playerAudio('audio/escovarOsDentes.mp3');
        break;
      case 'escova e pasta de dente':
        playerAudio('audio/EscovaEPastaDeDente.mp3');
        break;
      case 'cortador de unhas':
        playerAudio('audio/cortadorDeUnhas.mp3');
        break;
      case 'lavar as maos':
        playerAudio('audio/lavarAsMaos.mp3');
        break;
      case 'arrumar a cama':
        playerAudio('audio/arrumarACama.mp3');
        break;
      case 'roupa limpa':
        playerAudio('audio/roupaLimpa.mp3');
        break;
      case 'roupa suja':
        playerAudio('audio/roupaSuja.mp3');
        break;
      case 'camisa':
        playerAudio('audio/camisas.mp3');
        break;
      case 'hora de brincar':
        playerAudio('audio/horaDeBrincar.mp3');
        break;
      case 'abraco':
        playerAudio('audio/abraco.mp3');
        break;
      case 'amigos':
        playerAudio('audio/amigos.mp3');
        break;
      case 'comida':
        playerAudio('audio/comida.mp3');
        break;
      case 'agua':
        playerAudio('audio/agua.mp3');
        break;
      case 'lixo':
        playerAudio('audio/lixo.mp3');
        break;
      case 'televisao':
        playerAudio('audio/televisao.mp3');
        break;
      case 'ouvir musica':
        playerAudio('audio/ouvirMusica.mp3');
        break;
      case 'nao':
        playerAudio('audio/nao.mp3');
        break;
      case 'sim':
        playerAudio('audio/sim.mp3');
        break;
      
      //Fase 2
      case 'eu quero tomar banho':
        playerAudio('audio/tomarBanho.mp3');
        break;
      case 'eu quero ir ao banheiro':
        playerAudio('audio/euQueroIraoBanheiroR.mp3');
        break;
      case 'eu quero escovar os dentes':
        playerAudio('audio/euQueroEscovarOsDentes.mp3');
        break;
      case 'eu vou escovar os dentes':
        playerAudio('audio/euVouEscovarOsDentes.mp3');
        break;
      case 'eu quero cortar as unhas':
        playerAudio('audio/euQueroCortarUnhas.mp3');
        break;
      case 'eu quero lavar as maos':
        playerAudio('audio/euQueroLavarAsmaos.mp3');
        break;
      case 'eu quero ir dormir':
        playerAudio('audio/euQueroDormir.mp3');
        break;
      case 'eu vou arrumar a cama':
        playerAudio('audio/euVouArrumarACama.mp3');
        break;
      case 'essa roupa esta limpa':
        playerAudio('audio/essaRoupaEstaLimpa.mp3');
        break;
      case 'essa roupa esta suja':
        playerAudio('audio/EssaRoupaEstaSuja.mp3');
        break;
      case 'quero vestir essa camisa':
        playerAudio('audio/queroVestirEssaCamisa.mp3');
        break;
      case 'calcar sapatos':
        playerAudio('audio/calcarSapatos.mp3');
        break;
      case 'quero te abracar':
        playerAudio('audio/queroTeAbracar.mp3');
        break;
      case 'me da um abraco':
        playerAudio('audio/meDaUmAbraco.mp3');
        break;
      case 'quero ser seu amigo':
        playerAudio('audio/queroSerSeuAmigo.mp3');
        break;
      case 'voce e meu amigo!':
        playerAudio('audio/voceEmeuAmigo.mp3');
        break;
      case 'eu quero brincar':
        playerAudio('audio/euQueroBrincar.mp3');
        break;
      case 'quero comer':
        playerAudio('audio/queroComer.mp3');
        break;
      case 'estou com fome':
        playerAudio('audio/EstouComFome.mp3');
        break;
      case 'eu estou com sede':
        playerAudio('audio/estouComSede.mp3');
        break;
      case 'quero beber agua':
        playerAudio('audio/queroBeberAgua.mp3');
        break;
      case 'jogar lixo na lixeira':
        playerAudio('audio/jogarLixoNaLixeira.mp3');
        break;
      case 'quero assistir televisao':
        playerAudio('audio/queroAssistirTv.mp3');
        break;
      case 'quero ouvir musica':
        playerAudio('audio/queroOuvirMusica.mp3');
        break;
      case 'nao pode':
        playerAudio('audio/naoPode.mp3');
        break;
      case 'nao quero':
        playerAudio('audio/naoQuero.mp3');
        break;
      case 'eu posso':
        playerAudio('audio/euPosso.mp3');
        break;
      case 'eu quero':
        playerAudio('audio/euQuero.mp3');
        break;
      default:
        playerAudio('audio/nao.mp3');
    }
  }
}