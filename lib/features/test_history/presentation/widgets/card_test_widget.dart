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
                    width: width * 0.265,
                    icon: Icons.download,
                    buttonString: 'history_test_result_text_download',
                    onPressed: () {
                      _createPDF(authBloc);
                    }),
                ButtonWidget(
                    buttonColor: wColor.mapColors['S800'],
                    borderColor: wColor.mapColors['S800'],
                    textColor: wColor.mapColors['IDWhite'],
                    textStyle: const TextStyle(fontSize: 12),
                    iconSize: 14,
                    width: width * 0.27,
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

  Future<void> _createPDF(AuthBloc authBloc) async {
    PdfDocument document = PdfDocument();
    final PdfPageTemplateElement headerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
//Draw text in the header.
    headerTemplate.graphics.drawString(
        '${authBloc.state.name} ${authBloc.state.lastname} ',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Add the header element to the document.
    final PdfPageTemplateElement footerTemplate =
        PdfPageTemplateElement(const Rect.fromLTWH(0, 0, 515, 50));
//Draw text in the footer.
    footerTemplate.graphics.drawString(
        'This is page footer', PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: const Rect.fromLTWH(0, 15, 200, 20));
//Set footer in the document.
    document.template.bottom = footerTemplate;
    document.template.top = headerTemplate;

    document.pages.add().graphics.drawString(
        'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 150, 20));

    List<int> bytes = document.saveSync();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}
