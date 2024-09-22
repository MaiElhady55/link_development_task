import 'package:flutter/material.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SectionsView"),
      ),
      body: const Center(child: Text("Sections"),),
    );
  }
}
