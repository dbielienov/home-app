import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refrigerator/repositories/genres/abstract_genres_repository.dart';
import 'package:refrigerator/repositories/models/genre.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._repo) : super(DashboardInitial()) {
    on<DashboardLoadEvent>((event, emit) async {
      emit(DashboardLoading());
      try {
        final fetchedGenres = await _repo.getGenres();
        emit(DashboardLoaded(fetchedGenres));
      } catch (e) {
        final message = e.toString();
        emit(DashboardError(message));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractGenresRepository _repo;
}