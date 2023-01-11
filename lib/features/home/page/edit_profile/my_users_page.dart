import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/main_button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/home/widget/text_field_form_my_profile.dart';

import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../widget/info_column_widget.dart';

class MyUserPage extends StatefulWidget {
  const MyUserPage({super.key});

  @override
  State<MyUserPage> createState() => _MyUserPageState();
}

class _MyUserPageState extends State<MyUserPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    return MyAppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            navigationBloc.add(PageChanged(indexNavigation: 0));
            Navigator.pushNamed(context, 'navBar');
            // Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: wColor.mapColors['P00'],
          ),
        ),
        title: const TextWidget(
          text: 'my_user_profile',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: true,
      ),
      children: [
        Center(
          child: Stack(alignment: AlignmentDirectional.center, children: [
            Image.asset("assets/images/photo_user_edit.png"),
            Icon(
              Icons.image_outlined,
              size: 64,
              color: wColor.mapColors["IDWhite"],
            ),
            Positioned(
                bottom: height * 0.17,
                left: width * 0.31,
                child: FloatingActionButton(
                  elevation: 3.66,
                  backgroundColor: wColor.mapColors["500BASE"],
                  child: const Icon(
                    Icons.edit_outlined,
                    size: 24,
                  ),
                  onPressed: () {},
                ))
          ]),
        ),
        SizedBox(height: height * 0.070),
        const InfoColumnWidget(),
        SizedBox(height: height * 0.040),
        const TextFieldFormMyUser(
          textTitle: 'my_user_text_field_hint',
          iconTextField: Icon(Icons.keyboard_arrow_down_rounded),
          hintText: "my_user_text_field_label",
        ),
        SizedBox(height: height * 0.0485),
        Center(
          child: MainButtonWidget(
              buttonString: "my_user_button_saved",
              textColor: wColor.mapColors["IDWhite"],
              buttonColor: wColor.mapColors["500BASE"],
              borderColor: wColor.mapColors["500BASE"],
              onPressed: () {}),
        ),
        SizedBox(height: height * 0.0485),
      ],
    );
  }
}