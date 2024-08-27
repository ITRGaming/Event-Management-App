part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

final class TabChangedEvent extends MainEvent {
  final int tabIndex;
  TabChangedEvent({required this.tabIndex});
}
