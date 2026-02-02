import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: .fromARGB(255, 156, 90, 3)),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(title: 'Flutter Demo Home Page'),
				'/list': (context) => const ListWidgetScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(
              child: Text(
                'Item $index',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
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
              Navigator.of(context).pushNamed('/list', arguments: index);
            },
          );
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



// ! List Widget Screen
class ListWidgetScreen extends StatefulWidget {
  const ListWidgetScreen({super.key});

  @override
  State<ListWidgetScreen> createState() => _ListWidgetScreenState();
}

class _ListWidgetScreenState extends State<ListWidgetScreen> {
	String? id;
	@override
	void didChangeDependencies() {
		final index = ModalRoute.of(context)?.settings.arguments;
		if(index is int){
			id = 'index: $index';
		}
		print('id: $id');
    super.didChangeDependencies();
  
	}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Widget ${id ?? 'No id'}')),
      body: Center(child: Text('List Widget ${id ?? 'No id'}')),
    );
  }
}
