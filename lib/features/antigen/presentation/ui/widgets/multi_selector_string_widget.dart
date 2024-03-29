import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../medical_history/presentation/bloc/medical_history_bloc.dart';
import '../../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';

// ignore: must_be_immutable
class MultiSelectedStringWidget extends StatefulWidget {
  final List<String> listItem;
  final TextStyle? textStyleList;
  String? valueDefaultList;
  final Function(Object?)? onChanged;
  final List<String> listChip;
  final bool requiredTranslate;

  MultiSelectedStringWidget({
    super.key,
    required this.listItem,
    this.textStyleList,
    required this.onChanged,
    this.valueDefaultList = "Selection option",
    required this.listChip,
    required this.requiredTranslate,
  });

  @override
  State<MultiSelectedStringWidget> createState() =>
      _MultiSelectedStringWidgetState();
}

class _MultiSelectedStringWidgetState extends State<MultiSelectedStringWidget> {
  bool isSelected = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;

    return BlocBuilder<MedicalHistoryBloc, MedicalHistoryState>(
      builder: (context, state) {
        return Column(
          children: [
            DynamicContainerWidget(
                maxWidth: width * 0.922,
                minWidth: width * 0.922,
                children: [buildChoiceChip(widget.listChip)]),
            SizedBox(height: heigth * 0.02),
            Container(
              width: width * 0.922,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      disabledHint: Checkbox(
                          value: selected,
                          onChanged: (selectedValue) {
                            selected = selectedValue!;
                          }),
                      isExpanded: true,
                      items: widget.listItem
                          .map<DropdownMenuItem<Object>>((Object? value) {
                        return DropdownMenuItem<Object>(
                            value: value,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.028),
                              child: TextWidget(
                                text: value!.toString(),
                                textAlign: TextAlign.left,
                                requiresTranslate: widget.requiredTranslate,
                                style: widget.textStyleList ??
                                    TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.2,
                                        color: wColor.mapColors["S600"]),
                              ),
                            ));
                      }).toList(),
                      hint: Padding(
                        padding: EdgeInsets.only(left: width * 0.037),
                        child: TextWidget(
                          text: widget.valueDefaultList!,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      onChanged: widget.onChanged)),
            ),
          ],
        );
      },
    );
  }

  Widget buildChoiceChip(List<String> listChip) {
    final wColor = ThemesIdx20();

    return Wrap(
        spacing: 6,
        runSpacing: 6,
        children: List<Widget>.generate(listChip.length, (index) {
          return InputChip(
            label: TextWidget(
                text: listChip[index],
                style: TextStyle(
                    color: wColor.mapColors["P01"],
                    overflow: TextOverflow.ellipsis),
                requiresTranslate: widget.requiredTranslate),
            onDeleted: () {
              setState(() {
                listChip.removeAt(index);
              });
            },
            deleteIconColor: wColor.mapColors["P01"],
            deleteIcon: const Icon(Icons.clear, size: 15),
            backgroundColor: wColor.mapColors["Pink"],
            selectedColor: wColor.mapColors["Pink"],
            shape: StadiumBorder(
                side: BorderSide(color: wColor.mapColors["P01"]!, width: 3)),
          );
        }));
  }
}
