import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';

class MyUserPage extends StatelessWidget {
  const MyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      children: [
        Center(
          child: Text("Page of My user")
        )
      ],
    );
  }
}