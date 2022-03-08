import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(
            Icons.photo_album_outlined,
            color: AppTheme.primary,
          ),
          title: Text('Soy un título'),
          subtitle: Text(
              'Eu ex elit consequat labore. Est ullamco in tempor quis elit. Aliqua Lorem commodo aliquip aliqua esse occaecat incididunt ipsum. Minim est non eiusmod ullamco velit deserunt consequat quis incididunt pariatur magna exercitation. Cupidatat pariatur in in laborum aliquip. Sunt irure minim do Lorem quis cupidatat nulla labore nisi aliquip id.'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ],
          ),
        ),
      ]),
    );
  }
}
