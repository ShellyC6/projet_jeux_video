part of 'user_bloc.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserConnectEvent extends UserEvent{
  final String name;
  final String email;

  const UserConnectEvent({required this.name, required this.email});
}