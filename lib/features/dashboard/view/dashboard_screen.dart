import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:refrigerator/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:refrigerator/features/dashboard/widgets/dashboard_list_tile.dart';
import 'package:refrigerator/repositories/genres/abstract_genres_repository.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});
  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AbstractGenresRepository _repo = GetIt.I<AbstractGenresRepository>();
  final DashboardBloc _dashboardBloc = DashboardBloc(
    GetIt.I<AbstractGenresRepository>(),
  );

  @override
  void initState() {
    super.initState();
    _dashboardBloc.add(DashboardLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leadingWidth: 30,
        leading: SvgPicture.asset('assets/svg/logo.svg'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer<void>();
          _dashboardBloc.add(DashboardLoadEvent(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          bloc: _dashboardBloc,
          builder: (context, state) {
            if (state is DashboardLoaded) {
              return ListView.separated(
                itemCount: state.genres.length,
                itemBuilder: (context, index) {
                  return DashboardListTile(genre: state.genres[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.green);
                },
              );
            }
            if (state is DashboardError) {
              return Center(
                child: SizedBox(
                  height: 250,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Something went wrong'),
                      OutlinedButton(
                        onPressed: () {
                          _dashboardBloc.add(DashboardLoadEvent());
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
