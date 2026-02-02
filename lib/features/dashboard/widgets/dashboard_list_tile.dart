import 'package:flutter/material.dart';
import 'package:refrigerator/repositories/models/genre.dart';

class DashboardListTile extends StatelessWidget {
  final Genre genre;
  const DashboardListTile({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          genre.name,
          style: TextStyle(
            color: Colors.red,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.green,
            height: 3,
          ),
        ),
      ),
      subtitle: Center(child: Text('Subtitle ${genre.id}')),
      leading: Icon(Icons.ac_unit_outlined),
      trailing: Icon(Icons.ac_unit_outlined),
      dense: true,
      onTap: () {
        Navigator.of(context).pushNamed('/single', arguments: genre.id);
      },
    );
  }
}
