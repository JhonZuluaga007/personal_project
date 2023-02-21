import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';

class FormFieldDropdownWidget extends StatefulWidget {
  const FormFieldDropdownWidget({
    super.key,
    required this.width,
    required this.height,
    required this.question,
    required this.generalColor,
    required this.selectedValue,
    this.onChanged,
    required this.listItems,
  });

  final double width;
  final double height;
  final String question;
  final Color generalColor;
  final String selectedValue;
  final void Function(String?)? onChanged;
  final List<String> listItems;

  @override
  State<FormFieldDropdownWidget> createState() =>
      _FormFieldDropdownWidgetState();
}

class _FormFieldDropdownWidgetState extends State<FormFieldDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.question,
          requiresTranslate: false,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              color: widget.generalColor),
        ),
        SizedBox(height: widget.height * 0.13),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.generalColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                isEmpty: widget.selectedValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: widget.generalColor,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: widget.generalColor,
                        fontWeight: FontWeight.normal),
                    value: widget.selectedValue,
                    isDense: true,
                    isExpanded: true,
                    onChanged: widget.onChanged,
                    items: widget.listItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
