import 'package:flutter/material.dart';

abstract class Tools {
  static toastSucesso(String message, BuildContext context) {
    _toast(message, Colors.green, context);
  }

  static toastErro(String message, BuildContext context) {
    _toast(message, Colors.red, context);
  }

  static toastAlert(String message, BuildContext context) {
    _toast(message, Colors.orange, context);
  }

  static _toast(String message, Color color, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  static formatData(String? str) {
    if (str == null) return '';
    str = str.replaceAll('-', '');
    final year = str.substring(0, 4);
    final month = str.substring(4, 6);
    final day = str.substring(6, 8);
    return '$day/$month/$year';
  }

  static String removerAcentos(String? str) {
    if (str == null) return '';
    var comAcento =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < comAcento.length; i++) {
      str = str!.replaceAll(comAcento[i], semAcento[i]);
    }

    return str!;
  }

  static String toUpperCaseFirstLetter(String? price) {
    if (price == null) return '';
    price = price[0].toUpperCase() + price.substring(1, price.length);
    return price;
  }

  static String removendoCaracteresDoPreco(String? price) {
    if (price == null) return '';
    price = price.toString().toUpperCase().replaceAll("R\$", "");
    return price;
  }
}
