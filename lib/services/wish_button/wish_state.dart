part of 'wish_bloc.dart';

abstract class WishState extends Equatable {
  const WishState();

  @override
  List<Object> get props => [];
}

class WishInitialState extends WishState {
  final bool isWished;

  const WishInitialState({required this.isWished});

  @override
  List<Object> get props => [isWished,];
}