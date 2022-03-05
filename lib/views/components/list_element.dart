import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  final String content;
  const ListElement({ Key? key, required this.content }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(content, style: const TextStyle(fontSize: 20),),);
  }
}