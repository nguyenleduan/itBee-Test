part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeEvent {
  const WelcomeEvent();
}


class GetInitEvent extends WelcomeEvent {}