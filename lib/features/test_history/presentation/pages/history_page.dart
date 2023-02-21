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
                      const TextWidget(
                        text: 'history_test_result_text_one',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      const Icon(Icons.check),
                      const TextWidget(
                        text: 'Positive',
                        requiresTranslate: false,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      const TextWidget(
                        text: '1/11/2023',
                        requiresTranslate: false,
                        style: TextStyle(
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
                              borderRadius: BorderRadius.circular(5),
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
                              borderRadius: BorderRadius.circular(5),
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
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          height: size.height * 0.05,
                          width: size.width * 0.27,
                          child: const Center(child: Text('PCR tests')),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.030),
                  state.formStatus is FormSubmitting
                      ? const Padding(
                          padding: EdgeInsets.only(top: 32.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : SizedBox(
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
                              ])),
                ],
              );
            },
          ),
        )),
      )),
    );
  }
}
