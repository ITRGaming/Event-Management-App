import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainInitial(tabIndex: 0)) {
    on<MainEvent>((event, emit) {
      if (event is TabChangedEvent) {
        emit(MainInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
