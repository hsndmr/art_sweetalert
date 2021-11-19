import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ArtError extends StatelessWidget {
  final String title;

  const ArtError({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(right: 4.0),
              child: Icon(Icons.error, size: 18.0, color: Colors.red)),
          Expanded(child: Container(child: Text(title)))
        ],
      ),
    );
  }
}
