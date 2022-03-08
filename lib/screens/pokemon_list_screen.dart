import 'dart:convert';
import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screens.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  String baseUrl = "https://pokeapi.co/api/v2/pokemon/";
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  late Future<PokemonesList> pokemonesList;
  List pokemones = [];

  @override
  void initState() {
    super.initState();
    pokemonesList = fetchData();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 100 >=
          scrollController.position.maxScrollExtent) {
        pokemonesList = fetchData();
        setState(() {});
      }
    });
  }

  Future<PokemonesList> fetchData() async {
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return PokemonesList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load pokemones');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemones"),
      ),
      body: FutureBuilder<PokemonesList>(
        future: pokemonesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            pokemones = pokemones + snapshot.data!.results;
            baseUrl = snapshot.data!.next;
            return ListCustom(
              list: pokemones,
              scrollController: scrollController,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const LinearProgressIndicator(
            color: AppTheme.primary,
            value: null,
          );
        },
      ),
    );
  }
}

class ListCustom extends StatelessWidget {
  final List list;
  final ScrollController scrollController;

  const ListCustom(
      {Key? key, required this.list, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: scrollController,
        itemCount: list.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(list[index]['name']),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.indigo,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PokemonScreen(
                              url: list[index]['url'],
                              name: list[index]['name'],
                            )));
              },
            ),
        separatorBuilder: (_, __) => const Divider());
  }
}

class PokemonesList {
  final int total;
  final String next;
  final List results;

  const PokemonesList({
    required this.total,
    required this.next,
    required this.results,
  });

  factory PokemonesList.fromJson(Map<String, dynamic> json) {
    return PokemonesList(
        total: json['count'], next: json['next'], results: json['results']);
  }
}
