import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       * ? Que ocurre si el dispositivo tiene notch (como en el iphone)
       * i En este caso se queda un espacio en blanco a los lados del notch
       * i Con MediaQuery.removePadding podemos eliminar ese hueco, haciendo
       * i que la app ocupe todo el tamaño de pantalla
       * 
       * i En android sube la pantalla hasta por "detrás" de la bara de tareas
       */
      //appBar: AppBar(title: const Text("ListView Builder")),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return FadeInImage(
                width: double.infinity,
                height: 350,
                fit: BoxFit.fill,
                placeholder: const AssetImage('assets/gifs/jar-loading.gif'),
                image: NetworkImage(
                    "https://picsum.photos/500/300?image=${index + 1}"));
          },
        ),
      ),
    );
  }
}
