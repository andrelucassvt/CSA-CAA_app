part of 'player_audio_cubit.dart';

@immutable
abstract class PlayerAudioState {}

class PlayerAudioInitial extends PlayerAudioState {}

class PlayerAudioLoading extends PlayerAudioState {}

class PlayerAudioSucess extends PlayerAudioState {}

class PlayerAudioFailure extends PlayerAudioState {
  final String error;
  PlayerAudioFailure({
    required this.error,
  });
}
