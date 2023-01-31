import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_ui/common_widgets/responsive/dynamic_container_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';
import '../../../../config/theme/theme.dart';
import '../bloc/medical_history_bloc.dart';

class MultiSelectedWidget extends StatefulWidget {
  final List<String> listItem;
  final TextStyle? textStyleList;
  final String? valueDefaultList;

  const MultiSelectedWidget({
    super.key,
    required this.listItem,
    this.textStyleList,
    this.valueDefaultList = "Selection option",
  });

  @override
  State<MultiSelectedWidget> createState() => _MultiSelectedWidgetState();
}

class _MultiSelectedWidgetState extends State<MultiSelectedWidget> {
  List<String> chipListText = [];
  bool isSelected = false;
  bool selected = false;

  @override
  void initState() {
    super.initState();
  }

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
                children: [buildChoiceChip()]),
            SizedBox(height: heigth * 0.01),
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
                        .map<DropdownMenuItem<Object>>((Object value) {
                      return DropdownMenuItem<Object>(
                          value: value.toString(),
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.028),
                            child: TextWidget(
                              text: value.toString(),
                              textAlign: TextAlign.center,
                              style: widget.textStyleList ??
                                  TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.2,
                                      color: wColor.mapColors["S600"]),
                            ),
                          ));
                    }).toList(),
                    hint: Padding(
                      padding: EdgeInsets.only(left: width * 0.037),
                      child: TextWidget(text: widget.valueDefaultList!),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (chipListText.contains(value) != true) {
                          chipListText.add(value.toString());
                        }
                      });
                    }),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildChoiceChip() {
    return Wrap(
        spacing: 6,
        runSpacing: 6,
        children: List<Widget>.generate(chipListText.length, (index) {
          return InputChip(
            label: TextWidget(text: chipListText[index]),
            onDeleted: () {
              setState(() {
                chipListText.removeAt(index);
              });
            },
            backgroundColor: Colors.green,
            selected: true,
            selectedColor: Colors.lightBlue,
          );
        }));
  }
}
