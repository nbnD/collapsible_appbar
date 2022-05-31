import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
//  final Color color;
  final int index;
  final String url;
  final double width;
  static const String name='';
  static const String price='';

  const PageViewItem({
    Key? key,
    required this.index,
    required this.width,
    required this.url,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,

          width: width,
        ),
      ),
    );
  }
}
class MyModel {
  final String name;
  final String image;
  final String price;

  MyModel(this.name, this.image, this.price);
}

