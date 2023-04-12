import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(const LikeInitialState(isLiked: false)) {
   on<LikeClickEvent>((event, emit) {
    emit(LikeInitialState(isLiked: !(state as LikeInitialState).isLiked));
   });
  }
}