part of 'home_mobile_cubit.dart';

@immutable
abstract class HomeMobileState {}

class HomeMobileInitial extends HomeMobileState {}

class HomeMobileLoading extends HomeMobileState {}

class HomeMobileSucess extends HomeMobileState {
  final List<InteracaoEntity> list;
  HomeMobileSucess(this.list);
}

class HomeMobileFailure extends HomeMobileState {
  final Failure error;
  HomeMobileFailure(this.error);
}
