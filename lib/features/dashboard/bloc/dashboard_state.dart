part of 'dashboard_bloc.dart';

class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Genre> genres;

  DashboardLoaded(this.genres);
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}