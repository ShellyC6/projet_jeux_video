import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc() : super(const WishInitialState(isWished: false)) {
   on<WishClickEvent>((event, emit) {
    emit(WishInitialState(isWished: !(state as WishInitialState).isWished));
   });
  }
}