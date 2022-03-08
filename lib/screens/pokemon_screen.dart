import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonScreen extends StatefulWidget {
  final String url;

  const PokemonScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var response = await http.get(Uri.parse(widget.url));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon"),
      ),
      body: Center(
        child: Text(widget.url),
      ),
    );
  }
}

class Pokemon {}
