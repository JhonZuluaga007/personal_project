import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
    this.statusTest,
    this.sampleDate,
    this.styleText,
  }) : super(key: key);

  final dynamic Function() onPressed;
  final String textTestKit;
  final String? statusTest;
  final DateTime? sampleDate;
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
                      _createPDF(
                          authBloc, textTestKit, statusTest!, sampleDate!);
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

  Future<void> _createPDF(AuthBloc authBloc, String textTestKit,
      String statusTest, DateTime sampleDate) async {
    //MAIN CONFIG PDF
    final PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();
    final PdfGraphics graphics = page.graphics;
    final Size pageSize = page.size;
    //END MAIN CONFIG

    //DATE TIME AND USER INFO
    final DateFormat formatter = DateFormat('MM-dd-yyyy');
    final String testDate = formatter.format(sampleDate);
    final String initialText =
        'Participant: ${authBloc.state.name} ${authBloc.state.lastname} Test Date: $testDate\nTest Result:';

    //END DATA AND USER INFO

    //SET HEADER BASICS
    final PdfPageTemplateElement headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 130));
    //HEADER INFO
    final ByteData imageData = await rootBundle.load('assets/icons/tellMe.png');
    final Uint8List imageBytes = imageData.buffer.asUint8List();
    final PdfBitmap image = PdfBitmap(imageBytes);

    headerTemplate.graphics
        .drawImage(image, const Rect.fromLTWH(0, 0, 200, 40));
    headerTemplate.graphics.drawString(
        'Summary of Test Results', PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
        bounds: const Rect.fromLTWH(150, 45, 300, 50));

    final PdfPen pen = statusTest == 'Positive'
        ? PdfPen(PdfColor(135, 18, 0), width: 2)
        : PdfPen(PdfColor(36, 165, 70), width: 2);
    final PdfBrush brush = statusTest == 'Positive'
        ? PdfSolidBrush(PdfColor(135, 18, 0))
        : PdfSolidBrush(PdfColor(36, 165, 70));
    graphics.drawRectangle(
        pen: pen,
        brush: brush,
        bounds: Rect.fromLTWH(pageSize.width - 370, 120, 340, 40));
    final PdfBrush textBrush = PdfSolidBrush(PdfColor(255, 255, 255));
    //TODO GET THE ACTUAL STATUS FROM THE TEST
    final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 14);
    graphics.drawString('$statusTest FOR SARS-CoV-2', font,
        brush: textBrush,
        bounds: Rect.fromLTWH(pageSize.width - 350, 130, 250, 30),
        format: PdfStringFormat(
            lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.left));

    graphics.drawString(
        initialText, PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(0, 90, 700, pageSize.height));

    ///END HEADER

//Add the header element to the document.
    final PdfPageTemplateElement footerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 400, 100));

    //CONTENT TEXT
    String positiveContentText =
        'This means that SARS-Cov-2 (the virus that causes COVID-19) was detected in vour sample collected on $testDate \n\n\nHELPFUL INFORMATION FOR THE PARTICIPANT \nThe US Centers for Disease Control and Prevention (CDC) has provided useful information on how to care for yourself at home and how others in your household may protect themselves, the cDC has also provided information on when to seek medical attention. Key points are outlined below for your reference, and you can find more information at https://www.cdc.gov/coronavirus/2019-ncov. \nThe CDC recommends that individuals experiencing the following symptoms get medical attention immediately: \n - Trouble breathing \n - Persistent pain or pressure in the chest \n - New confusion \n - Inability to stay awake or wake after sleeping \n - Bluish lips or face \nAs the CDC instructs, before seeking medical care at an office, clinic, or hospital, please alert healthcare providers to the results of this test. However, do not delay seeking care if you are experiencing a medical emergency. \nCDC: FOR PEOPLE WHO ARE SICK \n - The CDC recommends that if you are or might be sick with COVID-19 stay home except to get medical care, and avoid using public transportation if you must leave your home, even if you have no symptoms, you can pass the infection on to others. \n - Separate yourself from other people in your home as much as possible \n - Wear a face mask over your nose and mouth if you are around other people, even at home \n - Cover your coughs and sneezes with a tissue. Dispose of the tissue in o lined trash can. clean your hands often with soap and water for at least 20 seconds, and avoid sharing household items (for example, utensils, towels glasses) as much as possible. \n - Clean and disinfect all frequently touched surfaces in your home often. if you are able, clean your bathroom and bedroom yourself and let others clean common areas. \n   -Please work with your provider to determine appropriate next steps, including when to and self-isolation.\n Learn more at https://www.cdc.gov/coronavirus/2019-ncov. ';
    final List<String> positiveColoredWords = positiveContentText.split(' ');

    for (String word in positiveColoredWords) {
      final PdfFont biggerFont = PdfStandardFont(PdfFontFamily.timesRoman, 20);
      word == 'HELPFUL'
          ? biggerFont
          : word == 'INFORMATION'
              ? biggerFont
              : word == 'FOR'
                  ? biggerFont
                  : word == 'THE'
                      ? biggerFont
                      : word == 'PARTICIPANT'
                          ? biggerFont
                          : word == 'CDC:'
                              ? biggerFont
                              : word == 'PEOPLE'
                                  ? biggerFont
                                  : word == 'WHO'
                                      ? biggerFont
                                      : word == 'ARE'
                                          ? biggerFont
                                          : word == 'SICK'
                                              ? biggerFont
                                              : PdfStandardFont(
                                                  PdfFontFamily.helvetica, 12);
      final PdfBrush colorBrush =
          word == 'https://www.cdc.gov/coronavirus/2019-ncov.'
              ? PdfSolidBrush(PdfColor(244, 145, 163))
              : PdfSolidBrush(PdfColor(0, 0, 0));
      String negativeContentText =
          'This means that SARS-Cov-2 (the virus that causes COVID-19) was detected in vour sample collected on $testDate \nBecause it is possible for this test to give a false negative in some people with COVID-19, the collection of multiple specimens may be necessary to detect the SARS-Cov-2 virus. The U.S. Food and Drug Administration (°DA) is advising people to perform repeat testing, also called serial testing, following a negative result on any at-home COVID-19 antigen test, to reduce the risk an infection may be missed (false negative result) and to help prevent people from unknowingly spreading the SARS-Cov-2 virus to others. The FDA recommends repeat testing following a negative result whether you have COVID-19 symptoms.\nAfter you use an at-home COVID-19 antigen test:\nIf you receive a positive result initially or after a repeat test, this means the test detected the SARS-CoV-2 virus and you most likely have COVID-19.\nFollow the Centers for Disease Control and Prevention (CDC) guidance for people with COVID-19, including to stay home, isolate from others, and seek follow-up care with a health care provider to determine the next steps.\n - If you receive a negative result, the test did not detect the SARS-Cov-2 virus at the time of that test.\nIf you have COVID-19 symptoms, test again 48 hours after the first negative test, for a total of at least two tests.\n - If you get a negative result on the second test and you are concerned that you could have COVID-19, you may choose to test again 48 hours after the second test, consider getting a laboratory molecular-based test, or call your health. care provider.\nIf you do not have COVID-19 symptoms and believe you have been exposed to CUVID-19, test again 48 hours after the first negative test, then 48 hours after the second negative test, for a total of at least three tests.\n - If you get a negative result on the second test, test again 48 hours after the second test.\n" If you get a negative result on the third test and you are concerned that you could have COVID-19, you may choose to test again using an antigen test, consider getting a laboratory molecular-based test, or call your health care provider.\n - If you get a positive result on any repeat test with an at-home COVID-19 antigen test, you most likely have COVID-19 and should follow the CDC guidance for people with COVID-19. ';
      statusTest == 'Positive'
          ? graphics.drawString(
              positiveContentText, PdfStandardFont(PdfFontFamily.helvetica, 12),
              brush: colorBrush,
              bounds: Rect.fromLTWH(0, 165, 500, pageSize.height))
          //Negative content Text
          : graphics.drawString(
              negativeContentText, PdfStandardFont(PdfFontFamily.helvetica, 12),
              brush: PdfSolidBrush(PdfColor(0, 0, 0)),
              bounds: Rect.fromLTWH(0, 165, 500, pageSize.height));
    }
//END CONTENT TEXT
//Draw text in the footer.

    footerTemplate.graphics.drawString('https://testing.tellme.tech',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        brush: PdfSolidBrush(PdfColor(244, 145, 163)),
        format: PdfStringFormat(
            lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.center),
        bounds: const Rect.fromLTWH(100, -10, 200, 20));
//Set footer in the document.
    document.template.bottom = footerTemplate;
    document.template.top = headerTemplate;

    List<int> bytes = document.saveSync();

    saveAndLaunchFile(bytes, 'Test: $textTestKit result.pdf');
  }
}
