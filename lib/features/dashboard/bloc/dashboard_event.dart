part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {}

class DashboardLoadEvent extends DashboardEvent {
  final Completer<void>? completer;

  @override
  List<Object?> get props => [completer];

  DashboardLoadEvent({this.completer});
}
