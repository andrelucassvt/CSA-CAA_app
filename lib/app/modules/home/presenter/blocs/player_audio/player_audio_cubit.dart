import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_csa_app/app/shared/util/player_audio_local.dart';

part 'player_audio_state.dart';

class PlayerAudioCubit extends Cubit<PlayerAudioState> {
  final PlayerAudioLocal playerAudioLocal;
  PlayerAudioCubit(
    this.playerAudioLocal,
  ) : super(PlayerAudioInitial());

  Future<void> playerAudio(String path) async {
    try {
      emit(PlayerAudioLoading());
      await playerAudioLocal.playerAudio(path.toLowerCase());
      emit(PlayerAudioSucess());
    } catch (e) {
      emit(PlayerAudioFailure(error: e.toString()));
    }
  }
}
