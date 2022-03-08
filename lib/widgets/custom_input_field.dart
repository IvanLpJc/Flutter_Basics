import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? inputType;
  final bool? isPassword;

  // Es la propiedad a la que va a apuntar del formulario
  final String formProperty;

  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.inputType,
    this.isPassword = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isPassword!,
        keyboardType: inputType,
        autofocus: false,
        textCapitalization: TextCapitalization.words,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) => formValues[formProperty] = value,
        validator: (value) {
          if (value == null) return 'Este campo es requerido';
          return value.length < 3 ? 'Minimo de 3 letras' : null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          //counterText: '3 caracteres'
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          //prefixIcon: Icon(Icons.verified_user_outlined)
          icon: icon == null ? null : Icon(icon),
        ));
  }
}
