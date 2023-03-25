import 'dart:convert';
import 'dart:io';

import 'package:Tellme/features/home/page/edit_profile/widgets/build_pop_up_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/theme/theme.dart';
import '../../widget/info_column_widget.dart';
import '../../widget/text_field_form_my_profile.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../common_ui/common_pages/my_app_scaffold_page.dart';

class MyUserPage extends StatefulWidget {
  const MyUserPage({super.key, required this.isBottom});

  @override
  State<MyUserPage> createState() => _MyUserPageState();

  final bool isBottom;
}

class _MyUserPageState extends State<MyUserPage> {
  late String imagePath;
  @override
  void initState() {
    imagePath = 'assets/images/no_image.png';
    BlocProvider.of<AuthBloc>(context).add(GetUser());

    super.initState();
  }

  File? imageDisplayed;
  Future getImage(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 4);
      if (image == null) return;
      final imageCameraTemporary = File(image.path);
      imageDisplayed = imageCameraTemporary;

      if (imageDisplayed != null) {
        final bytes = imageCameraTemporary.readAsBytesSync();
        String image64 = base64Encode(bytes);
        BlocProvider.of<AuthBloc>(context)
            .add(UpdateImage(profileImage: image64));
      }
      if (imageDisplayed == '' || imageDisplayed == null) {
        String image64 = base64.encode(imagePath.codeUnits);
        BlocProvider.of<AuthBloc>(context)
            .add(UpdateImage(profileImage: image64));
      }
      setState(() {
        imageDisplayed = imageCameraTemporary;
        print(imageDisplayed!.path);
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
      appBar: widget.isBottom
          ? AppBar(
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
            )
          : null,
      children: [
        SizedBox(height: height * 0.01),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Center(
              child: Stack(alignment: AlignmentDirectional.center, children: [
                //TODO: CHECK EDIT IMAGE PENCIL
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
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: CircleAvatar(
                          backgroundColor: wColor.mapColors["P01"],
                          backgroundImage: Image.file(imageDisplayed!).image,
                          radius: 100,
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
                imageDisplayed != null
                    ? Positioned(
                        bottom: height * 0.17,
                        left: width * 0.37,
                        child: SizedBox(
                          height: 48,
                          child: FloatingActionButton(
                            heroTag: "Boton3",
                            elevation: 3.66,
                            backgroundColor: wColor.mapColors["500BASE"],
                            onPressed: () {},
                            child: const Icon(
                              Icons.edit_outlined,
                              size: 24,
                            ),
                          ),
                        ))
                    : Positioned(
                        bottom: height * 0.16,
                        left: width * 0.34,
                        child: SizedBox(
                          height: 48,
                          child: FloatingActionButton(
                            heroTag: "Boton2",
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
        TextFieldFormMyUser(
          textTitle: 'my_user_text_field_hint',
          iconTextField: Icon(Icons.keyboard_arrow_down_rounded),
          hintText: "my_user_text_field_label",
        ),
      ],
    );
  }
}
