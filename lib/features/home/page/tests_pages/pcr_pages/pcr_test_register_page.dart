import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/icons/icons.dart';

import '../../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../../common_ui/common_widgets/text_field/text_field_with_border_widget.dart';
import '../../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../widget/test_widgets/app_bar_widget.dart';

class PcrRegisterPage extends StatelessWidget {
  const PcrRegisterPage({super.key, this.isHomeNavigation});

  final bool? isHomeNavigation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    return MyAppScaffold(
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: registerAppBarWidget(() {
        if (isHomeNavigation == true) {
          navigationBloc.add(PageChanged(indexNavigation: 0));
          Navigator.pushNamed(context, 'navBar');
        }
        if (isHomeNavigation == false) {
          navigationBloc.add(PageChanged(indexNavigation: 2));
          Navigator.pushNamed(context, 'navBar');
        }
      }, 'test_info_screen_text_two'),
      children: [
        SizedBox(height: size.height * 0.05),
        const TextWidget(
          text: 'pcr_test_text_one',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.025),
        SizedBox(
          height: size.height * 0.15,
          child: Image.asset(
            'assets/images/PrincipalBanner.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(height: size.height * 0.05),

        // Row(
        //   children: [
        //     const TextWidget(
        //       text: 'antigen_test_step_one_text',
        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //     ),
        //     SizedBox(
        //       width: size.width * 0.01,
        //     ),
        //     const TextWidget(
        //       //TODO GET THE USER FROM THE BACKEND
        //       text: 'Mateo Bonnet',
        //       requiresTranslate: false,
        //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        //     )
        //   ],
        // ),
        SizedBox(height: size.height * 0.015),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'pcr_test_text_four',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: size.height * 0.025),
            TextFieldWithBorderWidget(
              requiresTranslate: true,
              textInputType: TextInputType.text,
              borderColor: wColor.mapColors["T100"],
              hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: wColor.mapColors["S600"]),
              hintText: "antigen_test_step_one_text_hint",
              textStyle: const TextStyle(fontSize: 18),
              widthBorder: 3,
            ),
            SizedBox(height: size.height * 0.035),
            const TextWidget(
              text: 'pcr_test_text_two',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: size.height * 0.035),
            ButtonWidget(
                icon: Icons.qr_code_scanner,
                iconColor: Colors.black,
                buttonColor: Colors.white,
                borderColor: Colors.black,
                textColor: Colors.black,
                buttonString: 'test_part_one_text',
                onPressed: () {
                  //TODO OPEN QR SCAN and paste it into the identifier
                }),
            SizedBox(height: size.height * 0.055),
          ],
        )
      ],
    );
  }
}
