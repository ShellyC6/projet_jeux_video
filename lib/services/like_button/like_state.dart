part of 'like_bloc.dart';

abstract class LikeState extends Equatable {
  const LikeState();

  @override
  List<Object> get props => [];
}

class LikeInitialState extends LikeState {
  final bool isLiked;

  const LikeInitialState({required this.isLiked});

  @override
  List<Object> get props => [isLiked,];
}