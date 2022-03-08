import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & checks'),
      ),
      body: Column(
        children: [
          /** 
          * i Slider( //Podemos usar simplemente un widget o ver si tienen otra forma
          * i de ser construidos, en este caso, Slider.adaptative, se adapta al SO
          */
          Slider.adaptive(
              activeColor: AppTheme.primary,
              min: 50,
              max: 400,
              value: _sliderValue,
              onChanged: _sliderEnabled
                  ? (value) => setState(() {
                        _sliderValue = value;
                      })
                  : null),
          const Divider(
            thickness: 1,
            color: AppTheme.primary,
          ),
          /** 
           * i Este checkbox es muy soso por eso usamos el CheckboxListTile 
           */
          // Checkbox(
          //     value: _sliderEnabled,
          // *  Si ponemos el onChanged en null, deshabilitamos el checkbox
          //     onChanged: (value) => setState(() {
          //           _sliderEnabled = value ?? true;
          //         })),
          /**
           * i Con el checkboxtile puedes hacer click en toda la linea
           * i donde está el box 
           */
          CheckboxListTile(
              activeColor: AppTheme.primary,
              title: const Text("Habilitar slider"),
              value: _sliderEnabled,
              onChanged: (value) => setState(() {
                    _sliderEnabled = value ?? true;
                  })),
          const Divider(
            thickness: 1,
            color: AppTheme.primary,
          ),
          // Switch(
          //     value: _sliderEnabled,
          //     onChanged: (value) => setState(() {
          //           _sliderEnabled = value;
          //         })),
          SwitchListTile(
              /**
             * i Aqui también podemos usar el SwitchListTile.adaptative 
             * i para que se adapte al SO
             */
              title: const Text("Habilitar slider"),
              activeColor: AppTheme.primary,
              value: _sliderEnabled,
              onChanged: (value) => setState(() {
                    _sliderEnabled = value;
                  })),
          const Divider(
            thickness: 1,
            color: AppTheme.primary,
          ),
          /**
           * i Este tile nos permite ver las licencias que estamos 
           * i utilizando en nuestra app
           */
          const AboutListTile(),
          Expanded(
            /** 
             * i Porque no usar solo SingleChildScrollView
             * *Si solo utilizamos el SingleChildScrollView, este no funciona 
             * *porque no sabe que está usando el restante de espacio en pantalla
             * *de la columna, por eso utilizamos el Expanded, para que solo ese 
             * *widget tome todo el espacio posible
             */
            child: SingleChildScrollView(
              child: FadeInImage(
                image: const NetworkImage(
                    "https://cdn.pixabay.com/photo/2020/07/06/17/51/batman-5377804_960_720.png"),
                placeholder: const AssetImage('assets/gifs/jar-loading.gif'),
                width: _sliderValue,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
