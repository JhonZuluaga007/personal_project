import 'package:flutter/material.dart';
import 'package:Tellme/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:Tellme/common_ui/common_widgets/text/text_widget.dart';
import 'package:Tellme/common_ui/common_widgets/text_field/text_field_no_label_widget.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MyAppScaffold(
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Image.asset("assets/icons/idx_Icon.png"),
        centerTitle: true,
      ),
      children: [
        SizedBox(height: size.height * 0.025),
        TextWidget(
          text: 'support_text_one',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: size.height * 0.035),
        TextFieldNoLabelWidget(
            hintText: 'support_text_two',
            requiresTranslate: true,
            text: 'support_text_two'),
        SizedBox(height: size.height * 0.035),
        TextFieldNoLabelWidget(
            hintText: 'support_text_three',
            requiresTranslate: true,
            text: 'support_text_three'),
        SizedBox(height: size.height * 0.035),
        TextFieldNoLabelWidget(
            hintText: 'support_text_four',
            requiresTranslate: true,
            text: 'support_text_four'),
        SizedBox(height: size.height * 0.035),
        TextFieldNoLabelWidget(
            height: size.height * 0.15,
            maxLines: 5,
            hintText: 'support_text_six',
            requiresTranslate: true,
            text: 'support_text_five'),
      ],
    );
  }
}
