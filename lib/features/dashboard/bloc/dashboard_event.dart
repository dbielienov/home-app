part of 'dashboard_bloc.dart';

class DashboardEvent {}

class DashboardLoadEvent extends DashboardEvent {
  final Completer<void>? completer;

  DashboardLoadEvent({this.completer});
}
