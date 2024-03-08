import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_block_event.dart';
part 'home_block_state.dart';

class HomeBlockBloc extends Bloc<HomeBlockEvent, HomeBlockState> {
  HomeBlockBloc() : super(HomeBlockInitial()) {
    on<HomeBlockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
