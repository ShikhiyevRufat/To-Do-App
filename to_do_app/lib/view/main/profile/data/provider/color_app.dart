import 'package:flutter/material.dart';

class ColorAppProvider {
  List<Image> getColors() {
    return [
      Image.asset('assets/images/mavi.png'),
      Image.asset('assets/images/narinci.png'),
      Image.asset('assets/images/qehveyi.png'),
      Image.asset('assets/images/sari.png'),
      Image.asset('assets/images/yasil.png'),
      Image.asset('assets/images/cehrayi.png'),
    ];
  }
}
