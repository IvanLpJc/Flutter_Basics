import 'package:flutter/material.dart';

class ListViewInfinitScrollScreen extends StatefulWidget {
  const ListViewInfinitScrollScreen({Key? key}) : super(key: key);

  @override
  State<ListViewInfinitScrollScreen> createState() =>
      _ListViewInfinitScrollScreenState();
}

class _ListViewInfinitScrollScreenState
    extends State<ListViewInfinitScrollScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();

  /**
   *  i Usamos un controlador para ver distintos valores como la posición 
   *  i del scroll. Una vez tenemos el controlador necesitamos un listener
   *  i para escuchar el controlador
   * 
   *  i Cualquier widget con scroll tiene esos controladores
   */

  @override
  void initState() {
    /**
     *  i Esto se ejecuta cuando el estado del widget se crea por primera vez
     */
    super.initState();
    scrollController.addListener(() {
      // i Cada vez que se haga un scroll, aquí podemos obtener su información
      // i position.pixels ofrece el pixel donde estás
      // i position.maxScrollExtent ofrece el máximo de pixeles para hacer scroll
      print(
          ' ${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) add5();
    });
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("ListView Builder")),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (BuildContext context, int index) {
            return FadeInImage(
                width: double.infinity,
                height: 350,
                fit: BoxFit.fill,
                placeholder: const AssetImage('assets/gifs/jar-loading.gif'),
                image: NetworkImage(
                    "https://picsum.photos/500/300?image=${imagesIds[index]}"));
          },
        ),
      ),
    );
  }
}
