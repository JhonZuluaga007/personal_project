import 'package:flutter/material.dart';
import 'package:Tellme/common_ui/common_widgets/text/text_widget.dart';

import '../widget/faq_container_widget.dart';

class FAQSPage extends StatefulWidget {
  const FAQSPage({super.key});

  @override
  State<FAQSPage> createState() => _FAQSPageState();
}

class _FAQSPageState extends State<FAQSPage> {
  bool isBalanceVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Scrollbar(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.05),
              const TextWidget(
                text: 'faqs_text_title',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: size.height * 0.05),
              VissibleContainerWidget(
                height: size.height,
                width: size.width,
                balanceVisible: isBalanceVisible,
                questionText: 'faqs_text_question_one',
                questionAnswer: 'faqs_text_one',
              ),
              SizedBox(height: size.height * 0.025),
              VissibleContainerWidget(
                height: size.height,
                width: size.width,
                balanceVisible: isBalanceVisible,
                questionText: 'faqs_text_question_two',
                questionAnswer: 'faqs_text_two',
              ),
              SizedBox(height: size.height * 0.025),
              VissibleContainerWidget(
                height: size.height,
                width: size.width,
                balanceVisible: isBalanceVisible,
                questionText: 'faqs_text_question_three',
                questionAnswer: 'faqs_text_three',
              ),
              SizedBox(height: size.height * 0.025),
              VissibleContainerWidget(
                height: size.height,
                width: size.width,
                balanceVisible: isBalanceVisible,
                questionText: 'faqs_text_question_four',
                questionAnswer: 'faqs_text_four',
              ),
              SizedBox(height: size.height * 0.025),
              VissibleContainerWidget(
                height: size.height,
                width: size.width,
                balanceVisible: isBalanceVisible,
                questionText: 'faqs_text_question_five',
                questionAnswer: 'faqs_text_five',
              ),
              SizedBox(height: size.height * 0.025),
              VissibleContainerWidget(
                height: size.height,
                width: size.width,
                balanceVisible: isBalanceVisible,
                questionText: 'faqs_text_question_six',
                questionAnswer: 'faqs_text_six',
              ),
              SizedBox(height: size.height * 0.025),
            ],
          ),
        )),
      )),
    );
  }
}
