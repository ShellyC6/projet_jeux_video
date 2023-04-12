part of 'wish_bloc.dart';

abstract class WishEvent extends Equatable{
  const WishEvent();

  @override
  List<Object> get props => [];
}

class WishClickEvent extends WishEvent{

}