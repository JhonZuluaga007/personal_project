import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:personal_project/features/home/page/covid_19_test/ui/widgets/upload_final_widget.dart';

import '../../../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../../../../config/theme/theme.dart';

class ImageButtonsWidget extends StatefulWidget {
  const ImageButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageButtonsWidget> createState() => _ImageButtonsWidgetState();
}

class _ImageButtonsWidgetState extends State<ImageButtonsWidget> {
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
  //TODO CHECK IF necessary
  // Future<File> saveFilePerma(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File('${directory.path}$name');
  //   return File(imagePath).copy(image.path);
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final wColor = ThemesIdx20();

    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            SizedBox(
              width: width * 0.8,
              height: height * 0.3,
              child: imageDisplayed != null
                  ? Image.file(
                      imageDisplayed!,
                      width: width * 0.7,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : BackgroundImage(imagePath: imagePath),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    imageDisplayed = null;
                  });
                },
                child: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 24,
                )),
          ],
        ),
        SizedBox(height: height * 0.08),
        ButtonWidget(
            width: width * 0.920,
            height: height * 0.053,
            borderRadiusButton: 30,
            icon: Icons.file_upload_outlined,
            iconColor: wColor.mapColors["S800"],
            buttonString: "Upload_image_Button_text",
            textColor: wColor.mapColors["S800"],
            buttonColor: wColor.mapColors["P01"],
            borderColor: wColor.mapColors["S800"],
            onPressed: () => getImage(ImageSource.gallery)),
        SizedBox(height: height * 0.021),
        ButtonWidget(
            width: width * 0.920,
            height: height * 0.053,
            borderRadiusButton: 30,
            icon: Icons.camera_alt_outlined,
            iconColor: wColor.mapColors["S800"],
            buttonString: "Upload_picture_Button_text",
            textColor: wColor.mapColors["S800"],
            buttonColor: wColor.mapColors["P01"],
            borderColor: wColor.mapColors["S800"],
            onPressed: () => getImage(ImageSource.camera)),
      ],
    );
  }
}