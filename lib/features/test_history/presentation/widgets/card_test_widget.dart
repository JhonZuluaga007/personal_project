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
        .drawImage(image, const Rect.fromLTWH(0, 0, 200, 50));
    headerTemplate.graphics.drawString(
        'Summary of Test Results', PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
        bounds: const Rect.fromLTWH(180, 55, 300, 50));

    final PdfPen pen = PdfPen(PdfColor(255, 0, 0), width: 2);
    final PdfBrush brush = statusTest == 'Positive'
        ? PdfSolidBrush(PdfColor(135, 18, 0))
        : PdfSolidBrush(PdfColor(36, 165, 70));
    graphics.drawRectangle(
        pen: pen,
        brush: brush,
        bounds: Rect.fromLTWH(pageSize.width - 400, 130, 700, 50));
    final PdfBrush textBrush = PdfSolidBrush(PdfColor(255, 255, 255));
    //TODO GET THE ACTUAL STATUS FROM THE TEST
    final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 14);
    graphics.drawString('$statusTest FOR SARS-CoV-2', font,
        brush: textBrush,
        bounds: Rect.fromLTWH(pageSize.width - 350, 140, 250, 30),
        format: PdfStringFormat(
            lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.left));

    graphics.drawString(
        initialText, PdfStandardFont(PdfFontFamily.helvetica, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(0, 100, 700, pageSize.height));

    ///END HEADER

//Add the header element to the document.
    final PdfPageTemplateElement footerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 400, 100));
    //CONTENT TEXT
    String text =
        ' \n\n\nHELPFUL INFORMATION FOR THE PARTICIPANT \nThe US Centers for Disease Control and Prevention (CDC) has provided useful information on how to care for yourself at home and how others in your household may protect themselves, the cDC has also provided infornsation on when to seek medical attention. Key points are outlined below for your reference, and you can find more information at ntps://www.ede gov/coronavirus /2010-ncov \nThe CDC recommends that individuals experiencing the following symptoms get medical attention immediately: \n. Trouble breathing \n- Persistent pain or pressure in the chest \n• New confusion \n• Inability to stay awake or wake after sleeping \n- Bluish lips or face \nAs the CDC instructs, before seeking medical care at an office, clinic, or hospital, please alert healthcare providers to the results of this test. However, do not delay seeking care if you are experiencing a medical emergency. \nCDC: FOR PEOPLE WHO ARE SICK . The CDC recommends that if you are or might be sick with COVID-19 stay home except to get medical care, and avaid using public transportation if you must leave your home, even if you have no symptoms, you can pass the infection on to others. \n- Separate yoursell from other people in your home as much as possible \n* Wear a face mask over your nose and mouth if you are around other people, even at home \n* Cover your coughs and sneezes with a tissue. Dispose of the tissue in o lined trash can. clean your hands often with soap and water for at least 20 seconds, and avoid sharing household items (for example, utensils, towels glasses) as much as possible. \n*Clean and disinfect all frequently touched surfaces in your home often. if you are able, clean your bathroom and bedroom yourself and let others clean common areas. \nPlease work with your provider to determine appropriate next steps, including when to and self-isolation. ';

    graphics.drawString(text, PdfStandardFont(PdfFontFamily.helvetica, 14),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: Rect.fromLTWH(0, 140, 500, pageSize.height));
//END CONTENT TEXT
//Draw text in the footer.

    footerTemplate.graphics.drawString('https://testing.tellme.tech',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        format: PdfStringFormat(
            lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.center),
        bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Set footer in the document.
    document.template.bottom = footerTemplate;
    document.template.top = headerTemplate;

    List<int> bytes = document.saveSync();

    saveAndLaunchFile(bytes, 'Test: $textTestKit result.pdf');
  }
}
