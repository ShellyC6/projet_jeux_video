part of 'user_bloc.dart';

class UserState extends Equatable{
  //User currentUser = User(name: "c'est mon nom", email: "c'est mon mail");
  final User currentUser;

  UserState({required this.currentUser});

  @override
  List<Object> get props => [];
}

/*class UserInitialState extends UserState {

}*/