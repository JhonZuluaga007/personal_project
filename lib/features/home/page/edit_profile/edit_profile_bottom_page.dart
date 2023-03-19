import 'dart:convert';
import 'dart:io';
import 'package:Tellme/config/theme/theme.dart';
import 'package:Tellme/features/home/page/edit_profile/widgets/build_pop_up_image_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widget/info_column_widget.dart';
import '../../widget/text_field_form_my_profile.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../config/helpers/form_submission_status.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';

class EditUserFromBottomPage extends StatefulWidget {
  const EditUserFromBottomPage({super.key});

  @override
  State<EditUserFromBottomPage> createState() => _EditUserFromBottomPageState();
}

class _EditUserFromBottomPageState extends State<EditUserFromBottomPage> {
  late String imagePath;
  @override
  void initState() {
    imagePath = 'assets/images/no_image.png';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    File? imageDisplayed;

    Future getImageBottom(ImageSource source) async {
      try {
        final image =
            await ImagePicker().pickImage(source: source, imageQuality: 4);
        if (image == null) return;
        final imageCameraTemporary = File(image.path);
        imageDisplayed = imageCameraTemporary;

        if (imageDisplayed != null) {
          final bytes = imageCameraTemporary.readAsBytesSync();
          String img64 = base64Encode(bytes);
          BlocProvider.of<AuthBloc>(context)
              .add(UpdateImage(profileImage: img64));
        }
        if (imageDisplayed == '' || imageDisplayed == null) {
          String image64 = base64.encode(imagePath.codeUnits);
          BlocProvider.of<AuthBloc>(context)
              .add(UpdateImage(profileImage: image64));
        }
        setState(() {
          imageDisplayed = imageCameraTemporary;
        });
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
    }

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
          builder: (_, state) {
            if (state.formStatus is FormSubmitting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Column(
                  children: [
                    Stack(alignment: AlignmentDirectional.center, children: [
                      state.profileImage != null
                          ? CircleAvatar(
                              radius: 100,
                              backgroundColor: wColor.mapColors["P01"],
                              child: FadeInImage(
                                width: width * 0.79,
                                height: height * 0.30,
                                placeholder: AssetImage(imagePath),
                                image: NetworkImage(state.profileImage!),
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(imagePath);
                                },
                                fit: BoxFit.fill,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: CircleAvatar(
                                backgroundColor: wColor.mapColors["P01"],
                                backgroundImage:
                                    Image.file(imageDisplayed!).image,
                                radius: 100,
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
                              radius: 100,
                              backgroundColor: wColor.mapColors["P01"],
                              child: FadeInImage(
                                width: width * 0.79,
                                height: height * 0.30,
                                placeholder: AssetImage(imagePath),
                                image: NetworkImage(state.profileImage!),
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(imagePath);
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                      // imageDisplayed != null
                      //     ? Positioned(
                      //         bottom: height * 0.17,
                      //         left: width * 0.37,
                      //         child: SizedBox(
                      //           height: 48,
                      //           child: FloatingActionButton(
                      //             heroTag: "Boton3",
                      //             elevation: 3.66,
                      //             backgroundColor: wColor.mapColors["500BASE"],
                      //             onPressed: () {},
                      //             child: const Icon(
                      //               Icons.edit_outlined,
                      //               size: 24,
                      //             ),
                      //           ),
                      //         ))
                      //     : Positioned(
                      //         bottom: height * 0.16,
                      //         left: width * 0.34,
                      //         child: SizedBox(
                      //           height: 48,
                      //           child: FloatingActionButton(
                      //             heroTag: "Boton2",
                      //             elevation: 3.66,
                      //             backgroundColor: wColor.mapColors["500BASE"],
                      //             child: const Icon(
                      //               Icons.edit_outlined,
                      //               size: 24,
                      //             ),
                      //             onPressed: () => buildPopUpImage(context, () {
                      //               getImageBottom(ImageSource.camera);
                      //               Navigator.pop(context);
                      //             }, () {
                      //               getImageBottom(ImageSource.gallery);
                      //               Navigator.pop(context);
                      //             }),
                      //           ),
                      //         )),
                    ]),
                    SizedBox(height: height * 0.060),
                    const InfoColumnWidget(),
                    SizedBox(height: height * 0.030),
                    TextFieldFormMyUser(
                      textTitle: 'my_user_text_field_hint',
                      iconTextField:
                          const Icon(Icons.keyboard_arrow_down_rounded),
                      hintText: "my_user_text_field_label",
                    )
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
