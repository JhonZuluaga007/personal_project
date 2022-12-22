import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';

class CovidTestPage extends StatelessWidget {
  const CovidTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppScaffold(
      children: [
        Text("Page of Covid test")
      ],
    );
  }
}