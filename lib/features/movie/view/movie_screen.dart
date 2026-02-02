import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
	String? id;
	@override
	void didChangeDependencies() {
		final index = ModalRoute.of(context)?.settings.arguments;
		if(index is int){
			id = 'index: $index';
		}
    super.didChangeDependencies();
  
	}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Screen ${id ?? 'No id'}')),
      body: Center(child: Text('Movie Screen ${id ?? 'No id'}')),
    );
  }
}
