import 'package:flutter_learning/models/cat.dart';
import 'package:flutter/material.dart';

class FooterDetailsTab extends StatelessWidget {
  final Cat cat;

  FooterDetailsTab(
    this.cat,
  );

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return new Center(
      child: new Text(
        cat.description,
        textAlign: TextAlign.center,
        style: textTheme.subtitle1.copyWith(color: Colors.white),
      ),
    );
  }
}
