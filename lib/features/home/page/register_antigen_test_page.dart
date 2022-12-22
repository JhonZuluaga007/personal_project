import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';

class RegisterAntigenTestPage extends StatelessWidget {
  const RegisterAntigenTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Scrollbar(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Center(
                child: Text('Register_antigen_test'),
              )
            ],
          ),
        )),
      )),
    );
  }
}
