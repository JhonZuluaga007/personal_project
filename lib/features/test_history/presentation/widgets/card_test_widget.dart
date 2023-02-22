import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/features/test_history/presentation/widgets/open_file_widget.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../../config/theme/theme.dart';
import '../../../../common_ui/common_widgets/buttons/button_widget.dart';
import '../../../auth/bloc/auth_bloc.dart';

class CardTestWidget extends StatelessWidget {
  const CardTestWidget({
    Key? key,
    required this.onPressed,
    required this.textTestKit,
    this.styleText,
  }) : super(key: key);

  final dynamic Function() onPressed;
  final String textTestKit;
  final TextStyle? styleText;

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final stateUserId = BlocProvider.of<AuthBloc>(context).state;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.075,
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(width: 4, color: wColor.mapColors["T100"]!))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textTestKit,
                  style: styleText ?? const TextStyle(fontSize: 14),
                ),
                ButtonWidget(
                    buttonColor: wColor.mapColors['S800'],
                    borderColor: wColor.mapColors['S800'],
                    textColor: wColor.mapColors['IDWhite'],
                    textStyle: const TextStyle(fontSize: 12),
                    iconSize: 14,
                    width: width * 0.295,
                    icon: Icons.download,
                    buttonString: 'history_test_result_text_download',
                    onPressed: () {
                      _createPDF(authBloc, textTestKit);
                    }),
                ButtonWidget(
                    buttonColor: wColor.mapColors['S800'],
                    borderColor: wColor.mapColors['S800'],
                    textColor: wColor.mapColors['IDWhite'],
                    textStyle: const TextStyle(fontSize: 12),
                    iconSize: 14,
                    width: width * 0.295,
                    icon: Icons.remove_red_eye,
                    buttonString: 'history_button_icon',
                    onPressed: onPressed)
              ],
            ),
            SizedBox(
              height: height * 0.01,
            )
          ],
        ));
  }

  Future<void> _createPDF(AuthBloc authBloc, String textTestKit) async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    // final PdfPage page = document.pages.add();
    //Get page client size
    final PdfPageTemplateElement headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
//Draw text in the header.
    headerTemplate.graphics.drawString(
        'Summary of Test Results', PdfStandardFont(PdfFontFamily.helvetica, 24),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
        bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Add the header element to the document.
    final PdfPageTemplateElement footerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
    String text =
        '${authBloc.state.name} ${authBloc.state.lastname} \nHELPFUL INFORMATION FOR THE PARTICIPANT The US Centers for Disease Control and Prevention (CDC) has provided useful information on how to care for yourself at home and how others in your household may protect themselves, the cDC has also provided infornsation on when to seek medical attention. Key points are outlined below for your reference, and you can find more information at ntps://www.ede gov/coronavirus /2010-ncov The CDC recommends that individuals experiencing the following symptoms get medical attention immediately: . Trouble breathing - Persistent pain or pressure in the chest • New confusion • Inability to stay awake or wake after sleeping - Bluish lips or face As the CDC instructs, before seeking medical care at an office, clinic, or hospital, please alert healthcare providers to the results of this test. However, do not delay seeking care if you are experiencing a medical emergency. CDC: FOR PEOPLE WHO ARE SICK . The CDC recommends that if you are or might be sick with COVID-19 stay home except to get medical care, and avaid using public transportation if you must leave your home, even if you have no symptoms, you can pass the infection on to others. - Separate yoursell from other people in your home as much as possible * Wear a face mask over your nose and mouth if you are around other people, even at home * Cover your coughs and sneezes with a tissue. Dispose of the tissue in o lined trash can. clean your hands often with soap and water for at least 20 seconds, and avoid sharing household items (for example, utensils, towels glasses) as much as possible. *Clean and disinfect all frequently touched surfaces in your home often. if you are able, clean your bathroom and bedroom yourself and let others clean common areas. Please work with your provider to determine appropriate next steps, including when to and self-isolation. ';
    document.pages.add().graphics.drawString(
        text, PdfStandardFont(PdfFontFamily.helvetica, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 500, 500));
//Draw text in the footer.

    footerTemplate.graphics.drawString(
        'This is page footer', PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Set footer in the document.
    document.template.bottom = footerTemplate;
    document.template.top = headerTemplate;

    // document.pages.add().graphics.drawString(
    //     '${authBloc.state.name} ${authBloc.state.lastname} ',
    //     PdfStandardFont(PdfFontFamily.helvetica, 12),
    //     brush: PdfSolidBrush(PdfColor(0, 0, 0)),
    //     bounds: const Rect.fromLTWH(0, 0, 150, 20));

    List<int> bytes = document.saveSync();

    saveAndLaunchFile(bytes, 'Test: $textTestKit.pdf');
  }
}
