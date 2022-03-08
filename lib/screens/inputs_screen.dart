import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Iván',
      'last_name': 'López',
      'email': 'ivan@gmail.com',
      'password': '123456',
      'role': 'Admin',
    };

    return Scaffold(
        appBar: AppBar(title: const Text("Inputs y Forms")),
        //Este widget usado en el body permite hacer scroll cuando
        //solo hay un elemento en pantalla, en caso de que el elemento
        //sea muy largo, podremos hacer scroll, es como el overflow-y en CSS
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: myFormKey,
              child: Column(children: [
                CustomInputField(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  labelText: 'Apellido',
                  helperText: 'Apellido del usuario',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  labelText: 'Correo',
                  helperText: 'Correo del usuario',
                  inputType: TextInputType.emailAddress,
                  formProperty: 'correo',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  labelText: 'Contraseña',
                  helperText: 'Contraseña del usuario',
                  isPassword: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                DropdownButtonFormField<String>(
                  hint: const Text('Seleciona role'),
                  items: const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'Superuser',
                      child: Text('Superuser'),
                    ),
                    DropdownMenuItem(
                      value: 'Developer',
                      child: Text('Developer'),
                    ),
                    DropdownMenuItem(
                      value: 'Junior Developer',
                      child: Text('Junior Developer'),
                    )
                  ],
                  onChanged: (value) {
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      // Con esto quitamos el teclado cuando pulsamos el botón
                      FocusScope.of(context).requestFocus(FocusNode());

                      // Tenemos que decirle a dart que siempre vamos a tener un
                      // valor
                      if (!myFormKey.currentState!.validate()) {
                        print('Formulario no válido');
                        return;
                      }

                      //*imprimir valores del formulario
                      print(formValues);
                    },
                    child: const SizedBox(
                      child: Center(child: Text('Guardar')),
                      width: double.infinity,
                    )),
              ]),
            ),
          ),
        ));
  }
}
