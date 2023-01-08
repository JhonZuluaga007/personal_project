import 'package:flutter/material.dart';
import 'package:personal_project/features/home/widget/text_field_form_my_profile.dart';

import 'info_container_widget.dart';

class InfoColumnWidget extends StatelessWidget {
  const InfoColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const InfoContainerWidget(
          hintText: 'First name',
          text: 'Mateo',
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        const InfoContainerWidget(
          hintText: 'Middle name',
          text: 'Middle name',
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        const InfoContainerWidget(
          hintText: 'Last name',
          text: 'Bonnett',
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        const InfoContainerWidget(
          hintText: 'Date of birth',
          text: 'MM/DD/YYYY',
          icon: Icons.calendar_month,
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        const InfoContainerWidget(
          hintText: 'Phone number',
          text: '000 000 000',
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        const InfoContainerWidget(
          hintText: 'Email Address',
          text: 'mbonnett@bonnettanalytics.com',
        ),
      ],
    );
  }
}
