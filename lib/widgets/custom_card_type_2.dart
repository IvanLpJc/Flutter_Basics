import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? name;

  const CustomCardType2({Key? key, required this.imageUrl, this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: AppTheme.primary.withOpacity(0.5),
      elevation: 50,
      child: Column(children: [
        FadeInImage(
          placeholder: const AssetImage('assets/gifs/jar-loading.gif'),
          image: NetworkImage(imageUrl),
          width:
              double.infinity, //Double infinity toma todo el ancho disponible
          height: 230,
          fit: BoxFit
              .cover, //Establece que la imagen rellene todo el contenedor en el que está
          fadeInDuration: const Duration(milliseconds: 300),
        ),
        if (name != null)
          Container(
            child: Text(
                name!), //Con el simbolo ! le decimos a fluter que no se preocupe, que si no hay nombre, algo va a pasar pero está bien
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            alignment: AlignmentDirectional.centerEnd,
          ),
      ]),
    );
  }
}
