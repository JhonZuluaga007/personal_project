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
                    String positiveContentText =
                        'This means that SARS-Cov-2 (the virus that causes COVID-19) was detected in vour sample collected on  \n\nHELPFUL INFORMATION FOR THE PARTICIPANT \n\nThe US Centers for Disease Control and Prevention (CDC) has provided useful information on how to care for yourself at home and how others in your household may protect themselves, the CDC has also provided information on when to seek medical attention. Key points are outlined below for your reference, and you can find more information at https://www.cdc.gov/coronavirus/2019-ncov.\n\nThe CDC recommends that individuals experiencing the following symptoms get medical attention immediately: \n - Trouble breathing \n - Persistent pain or pressure in the chest \n - New confusion \n - Inability to stay awake or wake after sleeping \n - Bluish lips or face. \nAs the CDC instructs, before seeking medical care at an office, clinic, or hospital, please alert healthcare providers to the results of this test. However, do not delay seeking care if you are experiencing a medical emergency. \n\nCDC: FOR PEOPLE WHO ARE SICK \n - The CDC recommends that if you are or might be sick with COVID-19 stay home except to get medical care, and avoid using public transportation if you must leave your home, even if you have no symptoms, you can pass the infection on to others. \n - Separate yourself from other people in your home as much as possible \n - Wear a face mask over your nose and mouth if you are around other people, even at home \n - Cover your coughs and sneezes with a tissue. Dispose of the tissue in o lined trash can. clean your hands often with soap and water for at least 20 seconds, and avoid sharing household items (for example, utensils, towels glasses) as much as possible. \n - Clean and disinfect all frequently touched surfaces in your home often. if you are able, clean your bathroom and bedroom yourself and let others clean common areas. \n - Please work with your provider to determine appropriate next steps, including when to and self-isolation.\nLearn more at https://www.cdc.gov/coronavirus/2019-ncov. ';
                    final List<String> positiveColoredWords =
                        positiveContentText.split(' ');
                    print(positiveColoredWords);
                    popUpWidget(context, testList[index]);
                  },
                  textTestKit: testList[index].code!,
                  statusTest: testList[index].result![0]!.result!,
                  sampleDate: testList[index].sampleDate!.date,
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
