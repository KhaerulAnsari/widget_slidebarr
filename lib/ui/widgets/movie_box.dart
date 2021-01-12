import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:widget_slidebarr/ui/styles/styles.dart';

class MovieBox extends StatelessWidget {
  final String urls;
  final double scale;

  MovieBox(this.urls, {this.scale = 1});
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: parentStyle.clone()
        ..background.image(url: urls, fit: BoxFit.cover)
        ..width(200 * scale)
        ..height(300 * scale),
    );
  }
}
