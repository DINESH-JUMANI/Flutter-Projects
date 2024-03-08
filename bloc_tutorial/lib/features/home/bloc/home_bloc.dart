import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      on<HomeProductWishlistButtonClickedEvent>(
          homeProductWishlistButtonClickedEvent);
    });
    on<HomeEvent>((event, emit) {
      on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    });
    on<HomeEvent>((event, emit) {
      on<HomeWishlistButtonNavigateClickedEvent>(
          homeWishlistButtonNavigateClickedEvent);
    });
    on<HomeEvent>((event, emit) {
      on<HomeCartButtonNavigateClickedEvent>(
          homeCartButtonNavigateClickedEvent);
    });
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeWishlistButtonNavigateClickedEvent(
      HomeWishlistButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateClickedEvent(
      HomeCartButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }
}
