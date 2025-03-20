
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../go_router/go_router.dart';

part 'welcome_state.dart';
part 'welcome_event.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState> {

  WelcomeBloc() : super(InitState()) {
    on<GetInitEvent>(_init);
  }

  void _init(GetInitEvent event, Emitter<WelcomeState> emit) async {
    try {
      emit(InitState());
     await Timer(Duration(seconds: 3), () {
        router.goNamed('HomeScreen');
      });
    } catch (e) {
      print(e);
    }
   }
}

