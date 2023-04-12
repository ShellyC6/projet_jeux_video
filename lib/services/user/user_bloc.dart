import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(currentUser: User(name: "c'est mon nom", email: "c'est mon mail"))){
    on<UserConnectEvent>((event, emit) {
      emit(UserState(
          currentUser: User(name: event.name, email: event.email)
      ));
      //print("nom : ${state.currentUser.name}");
    });
  }
}