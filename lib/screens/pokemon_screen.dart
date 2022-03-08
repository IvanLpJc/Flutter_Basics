import 'dart:convert';

import 'package:fl_components/widgets/custom_card_type_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../extensions/string_extension.dart';

class PokemonScreen extends StatefulWidget {
  final String url;
  final String name;

  const PokemonScreen({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  // ignore: prefer_typing_uninitialized_variables
  late final contentJson;
  // late final String imageUrl;
  // late final String image;
  final isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
    //getImageUrl(imageUrl);
  }

  Future fetchData() async {
    var response = await http.get(Uri.parse(widget.url));
    contentJson = jsonDecode(response.body);
    //imageUrl = contentJson['forms'][0]['url'];
  }

/*
  Future getImageUrl(String url) async {
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    image = json['sprites']['back_default'];
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.capitalize()),
      ),
      body: Text(widget.name),
    );
  }
}

class Pokemon {}
