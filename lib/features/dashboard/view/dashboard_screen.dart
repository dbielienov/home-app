import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:refrigerator/features/dashboard/widgets/widgets.dart'
    show DashboardListTile;
import 'package:refrigerator/repositories/genres/abstract_genres_repository.dart';
import 'package:refrigerator/repositories/models/genre.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});
  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AbstractGenresRepository _repo = GetIt.I<AbstractGenresRepository>();

  List<Genre> genres = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leadingWidth: 30,
        leading: SvgPicture.asset('assets/svg/logo.svg'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return DashboardListTile(genre: genres[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.red);
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
      ),
    );
  }

  Future<void> _loadGenres() async {
    try {
      final fetchedGenres = await _repo.getGenres();
      if (!mounted) return;

      setState(() {
        genres = fetchedGenres;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }
}
