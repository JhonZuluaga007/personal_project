import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/buttons/button_widget.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/home/widget/text_field_form_my_profile.dart';

class MyUserPage extends StatelessWidget {
  const MyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return MyAppScaffold(
      crossAxisAlignment: CrossAxisAlignment.start,
      appBar: AppBar(
        backgroundColor: wColor.mapColors["IDWhite"],
        shadowColor: wColor.mapColors["IDWhite"],
        elevation: 4,
        actions: [
          Image.asset("assets/icons/idx_Icon.png"),
          SizedBox(
            width: width * 0.30,
          ),
        ],
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.037, vertical: height * 0.025),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: wColor.mapColors["S800"],
            child: Icon(Icons.arrow_back, color: wColor.mapColors["IDWhite"], size: 24,),
            onPressed: (){
              // Navigator.pop(context);
            }
          ),
        ),

        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, top: height * 0.018),
              child: TextWidget(
                text: "my_user_profile",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: -0.02,
                  fontWeight: FontWeight.w600,
                  color: wColor.mapColors["S800"]
                ),
              ),
            ),

            SizedBox(
              width: width * 0.24,
            ),

            ButtonWidget(
              icon: Icons.edit_outlined,
              iconSize: 16,
              width: width * 0.462,
              height: height * 0.047,
              buttonColor: wColor.mapColors["S800"],
              textColor: wColor.mapColors["IDWhite"],
              buttonString: "my_user_button_edit_profile", 
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700
              ),
              onPressed: (){}
            ),
          ],
        ),

        SizedBox(
          height: height * 0.052,
        ),

        Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset("assets/images/photo_user_edit.png"),
              Icon(
                Icons.image_outlined,
                size: 64,
                color: wColor.mapColors["IDWhite"],
              ),
              Positioned(
                bottom: 140,
                right: 3,
                child: FloatingActionButton(
                  elevation: 3.66,
                  backgroundColor: wColor.mapColors["500BASE"],
                  child: const Icon(Icons.edit_outlined, size: 24,),
                  onPressed: (){},
                )
              )
            ]            
          ),
        ),

        SizedBox(
          height: height * 0.070,
        ),

        const TextFieldFormMyUser(
          labelText: 'my_user_text_field_label', 
          textTitle: 'my_user_text_field_hint',
          iconTextField: Icon(Icons.keyboard_arrow_down_rounded),
          hintText: "my_user_text_field_label",
        ),

        SizedBox(
          height: height * 0.0485,
        ),

        Center(
          child: ButtonWidget(
            buttonString: "my_user_button_saved", 
            textColor: wColor.mapColors["IDWhite"],
            buttonColor: wColor.mapColors["500BASE"],
            borderColor: wColor.mapColors["500BASE"],
            onPressed: (){}
          ),
        )
        
      ],
    );
  }
}