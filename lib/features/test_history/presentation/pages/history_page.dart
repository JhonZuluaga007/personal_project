import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/config/helpers/form_submission_status.dart';

import '../../../auth/bloc/auth_bloc.dart';
import '../../bloc/test_history_bloc.dart';
import '../../../../config/theme/theme.dart';
import '../widgets/history_test_widget.dart';
import '../widgets/search_delgate_widget.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final double selectedBorder = 2.5;
  final double unselectedBorder = 1;

  bool allTestHistory = true;
  bool antigenTestHistoy = false;
  bool pcrTestHistory = false;

  @override
  Widget build(BuildContext context) {
    final wColor = ThemesIdx20();
    final size = MediaQuery.of(context).size;
    final stateUserId = BlocProvider.of<AuthBloc>(context).state;

    BlocProvider.of<TestHistoryBloc>(context)
        .add(GetHistoryTestEvent(stateUserId.userId));

    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Scrollbar(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<TestHistoryBloc, TestHistoryState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                        text: 'history_test_result_title',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showSearch(
                                context: context,
                                delegate: SearchDelegateWidget(
                                    listTestHistoryState:
                                        state.allTestHistoryList));
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          height: size.height * 0.05,
                          width: size.width * 0.35,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Search',
                                  style: TextStyle(
                                      color: wColor.mapColors["S800"]),
                                ),
                                const Spacer(),
                                const Icon(Icons.search)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: 'history_test_result_text_one',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      state.allTestHistoryList.isEmpty
                          ? Icon(Icons.cancel)
                          : state.allTestHistoryList.first.result!.isNotEmpty
                              ? state.allTestHistoryList.first.result![0]!
                                          .result ==
                                      "Negative"
                                  ? const Icon(Icons.cancel)
                                  : const Icon(Icons.check_circle)
                              : const SizedBox(),
                      SizedBox(width: size.width * 0.018),
                      TextWidget(
                        text: state.allTestHistoryList.isEmpty
                            ? "Negative"
                            : state.allTestHistoryList.first.result!.isNotEmpty
                                ? state.allTestHistoryList
                                        .firstWhere((element) =>
                                            element ==
                                            state.allTestHistoryList.first)
                                        .result!
                                        .isEmpty
                                    ? state.allTestHistoryList.first.result![0]!
                                        .result!
                                    : state.allTestHistoryList.first.result![0]!
                                        .result!
                                : "In progress",
                        requiresTranslate: false,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      TextWidget(
                        text: state.allTestHistoryList.isEmpty
                            ? "26-02-2023"
                            : "${state.allTestHistoryList.first.sampleDate!.date.day}-${state.allTestHistoryList.first.sampleDate!.date.month}-${state.allTestHistoryList.first.sampleDate!.date.year}",
                        requiresTranslate: false,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allTestHistory = true;
                            antigenTestHistoy = false;
                            pcrTestHistory = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: allTestHistory == true
                                      ? selectedBorder
                                      : unselectedBorder),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          height: size.height * 0.05,
                          width: size.width * 0.27,
                          child: const Center(child: Text('All tests')),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allTestHistory = false;
                            antigenTestHistoy = true;
                            pcrTestHistory = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: antigenTestHistoy == true
                                      ? selectedBorder
                                      : unselectedBorder),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          height: size.height * 0.05,
                          width: size.width * 0.27,
                          child: const Center(child: Text('Antigen tests')),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            allTestHistory = false;
                            antigenTestHistoy = false;
                            pcrTestHistory = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: pcrTestHistory == true
                                      ? selectedBorder
                                      : unselectedBorder),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          height: size.height * 0.05,
                          width: size.width * 0.27,
                          child: const Center(child: Text('PCR tests')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.030),
                  if (state.formStatus is SubmissionSuccess)
                    state.allTestHistoryList.isNotEmpty ||
                            state.antigenTestHistoryList.isNotEmpty ||
                            state.pcrTestHistoryList.isNotEmpty
                        ? SizedBox(
                            height: size.height * 0.48,
                            child: PageView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Stack(children: [
                                    HistoryTestWidget(
                                      isSelect: allTestHistory,
                                      testList: state.allTestHistoryList,
                                    ),
                                    HistoryTestWidget(
                                      isSelect: antigenTestHistoy,
                                      testList: state.antigenTestHistoryList,
                                    ),
                                    HistoryTestWidget(
                                      isSelect: pcrTestHistory,
                                      testList: state.pcrTestHistoryList,
                                    ),
                                  ]),
                                ]))
                        : Center(
                            child: Text(
                                "You have no current tests at the moment, please register a new test")),
                  if (state.formStatus is SubmissionFailed)
                    Text("Error loading your information of the test"),
                  if (state.formStatus is FormSubmitting)
                    Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                ],
              );
            },
          ),
        )),
      )),
    );
  }
}
