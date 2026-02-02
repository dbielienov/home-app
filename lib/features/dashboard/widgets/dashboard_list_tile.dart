import 'package:flutter/material.dart';

class DashboardListTile extends StatelessWidget {
  final int index;
  const DashboardListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          'Item $index',
          style: TextStyle(
            color: Colors.red,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.green,
            height: 3,
          ),
        ),
      ),
      subtitle: Center(child: Text('Subtitle $index')),
      leading: Icon(Icons.ac_unit_outlined),
      trailing: Icon(Icons.ac_unit_outlined),
      dense: true,
      onTap: () {
        Navigator.of(context).pushNamed('/single', arguments: index);
      },
    );
  }
}
