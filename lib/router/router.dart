import 'package:refrigerator/features/dashboard/dashboard.dart'
    show DashboardScreen;
import 'package:refrigerator/features/movie/movie.dart' show MovieScreen;

final routes = {
  '/': (context) => const DashboardScreen(title: 'Flutter Demo Home'),
  '/single': (context) => const MovieScreen(),
};
