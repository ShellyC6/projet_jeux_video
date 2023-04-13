part of 'user_bloc.dart';

class UserState extends Equatable{
  //User currentUser = User(name: "c'est mon nom", email: "c'est mon mail");

  final User currentUser;

  const UserState({required this.currentUser});

  @override
  List<Object> get props => [currentUser,];
}

/*class UserInitialState extends UserState {

}*/