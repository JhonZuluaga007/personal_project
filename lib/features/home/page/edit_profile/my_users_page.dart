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
                state.image != null
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: CircleAvatar(
                          backgroundColor: wColor.mapColors["P01"],
                          backgroundImage: NetworkImage(state.image!),
                          radius: 110,
                          onBackgroundImageError: (exception, stackTrace) {
                            Container(
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Image.asset('assets/images/no_image.png'),
                                  const TextWidget(
                                    text: 'error_image',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            );
                          },
                        ))
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: CircleAvatar(
                          backgroundColor: wColor.mapColors["P01"],
                          backgroundImage: Image.file(imageDisplayed!).image,
                          radius: 110,
                        ),
                      ),
                imageDisplayed != null
                    ? Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: CircleAvatar(
                          backgroundColor: wColor.mapColors["P01"],
                          backgroundImage: Image.file(imageDisplayed!).image,
                          radius: 110,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: wColor.mapColors["P01"],
                        backgroundImage: Image.network(state.image!).image,
                        radius: 110,
                        onBackgroundImageError: (exception, stackTrace) {
                          Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.asset('assets/images/no_image.png'),
                                const TextWidget(
                                  text: 'error_image',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                imageDisplayed != null
                    ? Positioned(
                        bottom: height * 0.18,
                        left: width * 0.38,
                        child: SizedBox(
                          height: 48,
                          child: FloatingActionButton(
                            elevation: 3.66,
                            backgroundColor: wColor.mapColors["500BASE"],
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 24,
                            ),
                            onPressed: () => buildPopUpImage(context, () {
                              getImage(ImageSource.camera);
                              Navigator.pop(context);
                            }, () {
                              getImage(ImageSource.gallery);
                              Navigator.pop(context);
                            }),
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: height * 0.17,
                        left: width * 0.42,
                        child: SizedBox(
                          height: 48,
                          child: FloatingActionButton(
                            elevation: 3.66,
                            backgroundColor: wColor.mapColors["500BASE"],
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 24,
                            ),
                            onPressed: () => buildPopUpImage(context, () {
                              getImage(ImageSource.camera);
                              Navigator.pop(context);
                            }, () {
                              getImage(ImageSource.gallery);
                              Navigator.pop(context);
                            }),
                          ),
                        )),
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
