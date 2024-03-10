import 'package:flutter/material.dart';
import 'package:furnitureapp/model/category_model.dart';

class BuildGuidePage extends StatelessWidget {
  final CategoryModel model;

  BuildGuidePage({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build Guide"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(model.buildGuide),
            // Add more information about how to build the item
          ],
        ),
      ),
    );
  }
}
