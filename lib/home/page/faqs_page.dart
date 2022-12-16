import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';

class FAQSPage extends StatelessWidget {
  const FAQSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      children: [
        Center(
          child: Text("Page of the FAQS")
        )
      ]
    );
  }
}