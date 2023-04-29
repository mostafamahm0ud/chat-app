import 'package:flutter/material.dart';

void scafoldmassage(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
}
