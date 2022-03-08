import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Alerta"),
            content: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: const [
                  Text(
                      "Est aliqua quis proident ut non elit laboris aliquip id Lorem elit quis ipsum commodo."),
                  SizedBox(
                    height: 10,
                  ),
                  FlutterLogo(
                    size: 100,
                  )
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text("Ok")),
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible:
            false, //true = Nos pemite cerrar el dialogo cuando pulsamos en la sombra
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12.5)),
            backgroundColor: Colors.indigo.shade900,
            elevation: 5,
            title: const Text(
              "Alerta",
              style: TextStyle(color: Colors.white),
            ),
            content: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: const [
                  Text(
                      "Est aliqua quis proident ut non elit laboris aliquip id Lorem elit quis ipsum commodo.",
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  FlutterLogo(
                    size: 100,
                  )
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: (() => Navigator.pop(context)),
                  child:
                      const Text("ok", style: TextStyle(color: Colors.white))),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Mostrar alerta",
              style: TextStyle(fontSize: 20),
            ),
          ),
          onPressed: () => Platform
                  .isAndroid // Con esto tenemos en cuenta en que plataforma estamos
              ? displayDialogAndroid(
                  context) // hay que importarlo de dart:io IMPORTANTE!
              : displayDialogIOS(context),
          // Podríamos poner el estilo así, pero en lugar de esto usamos app_theme
          // style: ElevatedButton.styleFrom(
          //     primary: AppTheme.primary,
          //     shape: const StadiumBorder(),
          //     elevation: 0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Navigator.pop(context)),
        child: const Icon(Icons.close),
        elevation: 0,
      ),
    );
  }
}
