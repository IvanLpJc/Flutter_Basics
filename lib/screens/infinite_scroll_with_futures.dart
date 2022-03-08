import 'package:fl_components/theme/app_theme.dart';
import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InfiniteScrollWithFuturesScreen extends StatefulWidget {
  const InfiniteScrollWithFuturesScreen({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollWithFuturesScreen> createState() =>
      _InfiniteScrollWithFuturesScreenState();
}

class _InfiniteScrollWithFuturesScreenState
    extends State<InfiniteScrollWithFuturesScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

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
          scrollController.position.maxScrollExtent) fetchData();
    });
  }

  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    add5();
    isLoading = false;
    setState(() {});
    final offset = scrollController.position.pixels + 100;

    // Compruebo si estamos abajo del todo, ya que si no estoy abajo del todo
    // no tiene sentido el rebote
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    // i Con esto extraemos el tamaño de la pantalla para así poder calcular
    // i el centro para el simbolo de carga
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //appBar: AppBar(title: const Text("ListView Builder")),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        /**
         *  i Utilizamos el stack para poder apilar diferentes widgets de
         *  i modo que podemos crear un widget para la carga y utilizarlo debajo
         *  i de la lista
         */
        child: Stack(
          children: [
            // i Este widget sirve para mostrar el icono de refresco cuando
            // i hacemos el scroll hacia arriba y hacer un pull to refresh

            RefreshIndicator(
              onRefresh: () => onRefresh(),
              color: AppTheme.primary,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.fill,
                      placeholder:
                          const AssetImage('assets/gifs/jar-loading.gif'),
                      image: NetworkImage(
                          "https://picsum.photos/500/300?image=${imagesIds[index]}"));
                },
              ),
            ),
            /**
             *  i Este Positioned nos permite situarlo donde queramos dentro de
             *  i la pantalla
             */
            if (isLoading)
              Positioned(
                  bottom: 40,
                  // Calculamos el punto central de la pantalla y le restamos la
                  // mitad de la anchura del widget para que así se quede centrado
                  left: size.width * 0.5 - 30,
                  child: const LoadingIcon()),
          ],
        ),
      ),
    );
  }
}
