import 'package:flutter/material.dart';

class RegisterPCRTestPage extends StatelessWidget {
  const RegisterPCRTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Scrollbar(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: const [
              Center(
                child: Text('Register_pcr_test'),
              )
            ],
          ),
        )),
      )),
    );
  }
}
