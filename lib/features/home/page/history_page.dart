import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/features/auth/bloc/auth_bloc.dart';
import 'package:personal_project/features/home/widget/history_widgets.dart/pop_up_widget.dart';
import 'package:personal_project/features/home/widget/search_delgate_widget.dart';
import 'package:personal_project/features/test_history/bloc/test_history_bloc.dart';

import '../../../config/theme/theme.dart';
import '../widget/history_widgets.dart/item_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                              delegate: SearchDelegateWidget(listTestHistoryState: state.testHistory));
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
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        height: size.height * 0.05,
                        width: size.width * 0.27,
                        child: const Center(child: Text('All tests')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        height: size.height * 0.05,
                        width: size.width * 0.27,
                        child: const Center(child: Text('Antigen tests')),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        height: size.height * 0.05,
                        width: size.width * 0.27,
                        child: const Center(child: Text('PCR tests')),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  SizedBox(
                    height: size.height * 0.48,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List<Widget>.generate(
                            state.testHistory.length, (index) {
                          return Column(
                            children: [
                              ItemWidget(
                                size: size,
                                wColor: wColor,
                                onPressed: () {
                                  BlocProvider.of<TestHistoryBloc>(context).add(
                                      GetViewTestEvent(
                                          state.testHistory[index].id!.oid!));
                                  popUpWidget(context);
                                },
                                textTestKit: state.testHistory[index].code!,
                              ),
                              SizedBox(height: size.height * 0.035),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              );
            },
          ),
        )),
      )),
    );
  }
}
