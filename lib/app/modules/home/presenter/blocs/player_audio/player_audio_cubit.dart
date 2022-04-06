import 'package:bloc/bloc.dart';
import 'package:diacritic/diacritic.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/shared/util/player_audio_local.dart';

part 'player_audio_state.dart';

class PlayerAudioCubit extends Cubit<PlayerAudioState> {
  final PlayerAudioLocal playerAudioLocal;
  PlayerAudioCubit(
    this.playerAudioLocal,
  ) : super(PlayerAudioInitial());

  Future<void> playerAudio(String path) async {
    final tratamentoPath = removeDiacritics(path);
    try {
      emit(PlayerAudioLoading());
      switch (tratamentoPath) {
        case 'bom dia':
          await playerAudioLocal.playerAudio(tratamentoPath);
          break;
        case 'boa tarde':
          await playerAudioLocal.playerAudio(tratamentoPath);
          break;
        default:
      }
      await playerAudioLocal.playerAudio(tratamentoPath);
      emit(PlayerAudioSucess());
    } catch (e) {
      emit(PlayerAudioFailure(error: e.toString()));
    }
  }
}
