import 'package:flutter/material.dart';

import '../widgets/pop_up_widget.dart';
import '../widgets/card_test_widget.dart';
import '../../domain/entities/test_history_entity.dart';

class HistoryTestWidget extends StatelessWidget {
  const HistoryTestWidget({
    Key? key,
    required this.isSelect,
    required this.testList,
  }) : super(key: key);

  final bool isSelect;
  final List<TestHistoryEntity> testList;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Visibility(
      visible: isSelect,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: height * 0.018);
              },
              itemBuilder: (_, index) {
                return CardTestWidget(
                  onPressed: () {
                    popUpWidget(context, testList[index]);
                  },
                  textTestKit: testList[index].code!,
                );
              },
              itemCount: testList.length,
            ),
          )
        ],
      ),
    );
  }
}
