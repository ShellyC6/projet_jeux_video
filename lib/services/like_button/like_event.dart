part of 'like_bloc.dart';

abstract class LikeEvent extends Equatable{
  const LikeEvent();

  @override
  List<Object> get props => [];
}

class LikeClickEvent extends LikeEvent{

}