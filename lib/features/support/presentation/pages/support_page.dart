//THIS CLASS IS NOT USED AT THE MOMENT CAN BE USED LATER IF NEEDED IN DRAWER.

// import 'dart:io';

// import 'package:Tellme/common_ui/common_widgets/buttons/main_button_widget.dart';
// import 'package:Tellme/config/theme/theme.dart';
// import 'package:Tellme/features/home/widget/test_widgets/app_bar_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:Tellme/common_ui/common_pages/my_app_scaffold_page.dart';
// import 'package:Tellme/common_ui/common_widgets/text/text_widget.dart';
// import 'package:Tellme/common_ui/common_widgets/text_field/text_field_no_label_widget.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../common_ui/common_widgets/buttons/button_widget.dart';

// class SupportPage extends StatefulWidget {
//   const SupportPage({super.key});

//   @override
//   State<SupportPage> createState() => _SupportPageState();
// }

// class _SupportPageState extends State<SupportPage> {
//   String imagePath = "assets/images/no_image.png";
//   File? imageDisplayed;
//   Future getImage(ImageSource source) async {
//     try {
//       final image =
//           await ImagePicker().pickImage(source: source, imageQuality: 4);
//       if (image == null) return;
//       final imageCameraTemporary = File(image.path);
//       setState(() {
//         imageDisplayed = imageCameraTemporary;
//       });
//     } on PlatformException catch (e) {
//       debugPrint('Failed to pick image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final wColor = ThemesIdx20();

//     return MyAppScaffold(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         title: Image.asset("assets/icons/idx_Icon.png"),
//         centerTitle: true,
//       ),
//       children: [
//         SizedBox(height: height * 0.025),
//         TextWidget(
//           text: 'support_text_one',
//           style: TextStyle(fontSize: 20),
//         ),
//         SizedBox(height: height * 0.035),
//         TextFieldNoLabelWidget(
//             hintText: 'support_text_two',
//             requiresTranslate: true,
//             text: 'support_text_two'),
//         SizedBox(height: height * 0.035),
//         TextFieldNoLabelWidget(
//             hintText: 'support_text_three',
//             requiresTranslate: true,
//             text: 'support_text_three'),
//         SizedBox(height: height * 0.035),
//         TextFieldNoLabelWidget(
//             hintText: 'support_text_four',
//             requiresTranslate: true,
//             text: 'support_text_four'),
//         SizedBox(height: height * 0.035),
//         TextFieldNoLabelWidget(
//             height: height * 0.15,
//             maxLines: 5,
//             hintText: 'support_text_six',
//             requiresTranslate: true,
//             text: 'support_text_five'),
//         SizedBox(height: height * 0.035),
//         TextWidget(
//           text: "support_text_seven",
//           style: TextStyle(
//             color: wColor.mapColors["S800"],
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         SizedBox(height: height * 0.020),
//         Center(
//           child: Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Container(
//                 width: 300,
//                 height: 150,
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                 child: FadeInImage(
//                   placeholder: AssetImage(imagePath),
//                   image: imageDisplayed == null
//                       ? AssetImage("assets/images/no_image.png")
//                       : Image.file(imageDisplayed!).image,
//                 ),
//               ),
//               InkWell(
//                   onTap: () {
//                     setState(() {
//                       imageDisplayed = null;
//                     });
//                   },
//                   child: const Icon(
//                     Icons.cancel,
//                     color: Colors.red,
//                     size: 24,
//                   )),
//             ],
//           ),
//         ),
//         SizedBox(height: height * 0.035),
//         Center(
//           child: ButtonWidget(
//               width: width * 0.92,
//               height: height * 0.050,
//               borderRadiusButton: 13,
//               icon: Icons.file_upload_outlined,
//               iconColor: wColor.mapColors["S800"],
//               buttonString: "support_text_seven",
//               textColor: wColor.mapColors["S800"],
//               buttonColor: wColor.mapColors["P01"],
//               borderColor: wColor.mapColors["S800"],
//               onPressed: () => getImage(ImageSource.gallery)),
//         ),
//         SizedBox(height: height * 0.035),
//         Center(
//           child: MainButtonWidget(
//               width: width * 0.92,
//               height: height * 0.055,
//               borderRadiusButton: 30,
//               buttonString: "support_text_nine",
//               textColor: wColor.mapColors["P01"],
//               buttonColor: wColor.mapColors["Pink"],
//               borderColor: wColor.mapColors["Pink"],
//               onPressed: () => getImage(ImageSource.gallery)),
//         ),
//         SizedBox(height: height * 0.035),
//       ],
//     );
//   }
// }
