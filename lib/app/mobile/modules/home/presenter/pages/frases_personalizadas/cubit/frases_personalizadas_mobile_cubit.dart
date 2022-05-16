import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'frases_personalizadas_mobile_state.dart';

class FrasesPersonalizadasMobileCubit extends Cubit<FrasesPersonalizadasMobileState> {
  FrasesPersonalizadasMobileCubit() : super(FrasesPersonalizadasMobileInitial());
}
