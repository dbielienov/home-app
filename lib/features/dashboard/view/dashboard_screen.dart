import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refrigerator/features/dashboard/widgets/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});
  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: SvgPicture.asset('assets/svg/logo.svg', width: 2, height: 2),
      ),
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) {
          return DashboardListTile(index: index);
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.blue,
        foregroundColor: Colors.yellow,
        child: const Icon(Icons.ac_unit_outlined),
      ),
    );
  }
}

