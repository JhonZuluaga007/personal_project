import 'package:flutter/material.dart';

class DropDownContainerWidget extends StatefulWidget {
  const DropDownContainerWidget({
    required this.listItems,
    required this.mainValue,
    required this.width,
    this.onChanged,
    Key? key,
  }) : super(key: key);
  final List<String> listItems;
  final String mainValue;
  final void Function(String?)? onChanged;
  final double width;

  @override
  State<DropDownContainerWidget> createState() =>
      _DropDownContainerWidgetState();
}

class _DropDownContainerWidgetState extends State<DropDownContainerWidget> {
  _DropDownContainerWidgetState();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.only(left: 5.0),
        height: height * 0.06,
        width: widget.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: DropdownButton(
            items: widget.listItems.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            hint: Text(widget.mainValue),
            value: widget.mainValue,
            onChanged: widget.onChanged,
          ),
        ));
  }
}
