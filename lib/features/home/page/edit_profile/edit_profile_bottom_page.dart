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

import '../../../auth/bloc/auth_bloc.dart';
import '../../widget/info_column_widget.dart';

class EditUserFromBottomPage extends StatefulWidget {
  const EditUserFromBottomPage({super.key});

  @override
  State<EditUserFromBottomPage> createState() => _EditUserFromBottomPageState();
}

class _EditUserFromBottomPageState extends State<EditUserFromBottomPage> {
  late String imagePath;
  @override
  void initState() {
    // TODO: implement initState
    imagePath = 'assets/images/no_image.png';
    super.initState();
  }

  File? imageDisplayed;
  Future getImageBottom(ImageSource source) async {
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

    return MyAppScaffold(
      children: [
        SizedBox(height: height * 0.025),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextWidget(
              text: 'my_user_profile',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: height * 0.015),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    state.image != null
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: CircleAvatar(
                              backgroundColor: wColor.mapColors["P01"],
                              backgroundImage: AssetImage(imagePath),
                              radius: 110,
                            ))
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: CircleAvatar(
                              backgroundColor: wColor.mapColors["P01"],
                              backgroundImage:
                                  Image.file(imageDisplayed!).image,
                              radius: 110,
                            ),
                          ),
                    imageDisplayed != null
                        ? Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: CircleAvatar(
                              backgroundColor: wColor.mapColors["P01"],
                              backgroundImage:
                                  Image.file(imageDisplayed!).image,
                              radius: 110,
                            ),
                          )
                        : CircleAvatar(
                            radius: 110,
                            backgroundColor: wColor.mapColors["P01"],
                            child: Image.network(state.image!,
                                errorBuilder: (context, error, stackTrace) {
                              return Container(
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
                            })),
                    imageDisplayed != null
                        ? Positioned(
                            bottom: height * 0.17,
                            left: width * 0.37,
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
                                  getImageBottom(ImageSource.camera);
                                  Navigator.pop(context);
                                }, () {
                                  getImageBottom(ImageSource.gallery);
                                  Navigator.pop(context);
                                }),
                              ),
                            ),
                          )
                        : Positioned(
                            bottom: height * 0.18,
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
                                  getImageBottom(ImageSource.camera);
                                  Navigator.pop(context);
                                }, () {
                                  getImageBottom(ImageSource.gallery);
                                  Navigator.pop(context);
                                }),
                              ),
                            )),
                  ]),
                  SizedBox(height: height * 0.060),
                  const InfoColumnWidget(),
                  SizedBox(height: height * 0.070),
                  TextFieldFormMyUser(
                    textTitle: 'my_user_text_field_hint',
                    iconTextField:
                        const Icon(Icons.keyboard_arrow_down_rounded),
                    hintText: "my_user_text_field_label",
                    imageState: state.image,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
