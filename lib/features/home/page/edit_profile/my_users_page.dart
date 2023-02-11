import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/config/theme/theme.dart';
import 'package:personal_project/features/home/page/edit_profile/widgets/build_pop_up_image_widget.dart';
import 'package:personal_project/features/home/widget/text_field_form_my_profile.dart';

import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../auth/bloc/auth_bloc.dart';
import '../../widget/info_column_widget.dart';

class MyUserPage extends StatefulWidget {
  const MyUserPage({super.key});

  @override
  State<MyUserPage> createState() => _MyUserPageState();
}

class _MyUserPageState extends State<MyUserPage> {
  late String imagePath;
  @override
  void initState() {
    // TODO: implement initState
    imagePath = 'assets/images/no_image.png';
    super.initState();
  }

  File? imageDisplayed;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageCameraTemporary = File(image.path);
      // final imagePermanent = await saveFilePerma(image.path);
      setState(() {
        imageDisplayed = imageCameraTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

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
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Center(
              child: Stack(alignment: AlignmentDirectional.center, children: [
                state.image != null || imageDisplayed != null
                    ? Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: state.image != null || imageDisplayed != null
                            ? Image.network(state.image!)
                            : Container(
                                height: height * 0.3,
                                width: width * 0.5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.file(
                                  imageDisplayed!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                      )
                    : Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/images/photo_user_edit.png",
                          fit: BoxFit.contain,
                        )),
                imageDisplayed != null || state.image != null
                    ? const SizedBox()
                    : Icon(
                        Icons.image_outlined,
                        size: 64,
                        color: wColor.mapColors["IDWhite"],
                      ),
                state.image != null || imageDisplayed != null
                    ? Positioned(
                        bottom: height * 0.245,
                        left: width * 0.36,
                        child: SizedBox(
                          height: 40,
                          child: FloatingActionButton(
                            elevation: 3.66,
                            backgroundColor: wColor.mapColors["500BASE"],
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 24,
                            ),
                            //TODO POPUP IMAGE FROM CAMERA OR FROM GALLERY
                            onPressed: () => buildPopUpImage(context, () {
                              getImage(ImageSource.camera);
                            }, () {
                              getImage(ImageSource.gallery);
                            }),
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: height * 0.17,
                        left: width * 0.31,
                        child: FloatingActionButton(
                          elevation: 3.66,
                          backgroundColor: wColor.mapColors["500BASE"],
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 24,
                          ),
                          //TODO POPUP IMAGE FROM CAMERA OR FROM GALLERY
                          onPressed: () => buildPopUpImage(context, () {
                            getImage(ImageSource.camera);
                          }, () {
                            getImage(ImageSource.gallery);
                          }),
                        ))
              ]),
            );
          },
        ),
        SizedBox(height: height * 0.070),
        const InfoColumnWidget(),
        SizedBox(height: height * 0.040),
        const TextFieldFormMyUser(
          textTitle: 'my_user_text_field_hint',
          iconTextField: Icon(Icons.keyboard_arrow_down_rounded),
          hintText: "my_user_text_field_label",
        ),
      ],
    );
  }
}
