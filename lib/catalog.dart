import 'package:flutter/material.dart';
import 'package:kcapstone/nearby.dart';

class CatalogList extends StatelessWidget {
  final List<Nearby> photos;

  CatalogList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].picture);
      },
    );
  }
}
