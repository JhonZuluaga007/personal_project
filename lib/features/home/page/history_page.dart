import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';
import 'package:personal_project/features/auth/bloc/auth_bloc.dart';
import 'package:personal_project/features/home/widget/history_widgets.dart/pop_up_widget.dart';
import 'package:personal_project/features/home/widget/search_delgate_widget.dart';
import 'package:personal_project/features/test_history/bloc/test_history_bloc.dart';
import 'package:personal_project/features/test_history/domain/entities/test_history_entity.dart';
import 'package:personal_project/icons/icons.dart';

import '../../../config/theme/theme.dart';
import '../widget/history_widgets.dart/item_widget.dart';

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

  List<TestHistoryEntity> allTestHistoryList = [];
  List<TestHistoryEntity> antigenTestHistoryList = [];
  List<TestHistoryEntity> pcrTestHistoryList = [];

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
              allTestHistoryList = state.allTestHistoryList;
              antigenTestHistoryList = state.allTestHistoryList;
              pcrTestHistoryList = state.allTestHistoryList;

              debugPrint(state.allTestHistoryList.length.toString());
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
                                    listTestHistoryState: state.allTestHistoryList));
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
                        onTap: (){
                          setState(() {
                            allTestHistory = true;
                            antigenTestHistoy = false;
                            pcrTestHistory = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: allTestHistory == true ? selectedBorder : unselectedBorder),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          height: size.height * 0.05,
                          width: size.width * 0.27,
                          child: const Center(child: Text('All tests')),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            allTestHistory = false;
                            antigenTestHistoy = true;
                            pcrTestHistory = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: antigenTestHistoy == true ? selectedBorder : unselectedBorder),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          height: size.height * 0.05,
                          width: size.width * 0.27,
                          child: const Center(child: Text('Antigen tests')),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            allTestHistory = false;
                            antigenTestHistoy = false;
                            pcrTestHistory = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: pcrTestHistory == true ? selectedBorder : unselectedBorder),
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
                  SizedBox(
                    height: size.height * 0.48,
                    child: SingleChildScrollView(
                      child: Stack(children: [
                        buildAllTest(size, wColor),
                        buildAntigenTest(size, wColor),
                        buildPCRTest(size, wColor),
                      ]),
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

  Widget buildAllTest(Size size, ThemesIdx20 wColor) {
    return Visibility(
      visible: allTestHistory,
      child: BlocBuilder<TestHistoryBloc, TestHistoryState>(
        builder: (context, state) {
          for (var i = 0; i < state.allTestHistoryList.length; i++) {
            if(state.allTestHistoryList[i].type!.type == "Antigen" || state.allTestHistoryList[i].type!.type == "PCR"){
              if(state.allTestHistoryList.contains(allTestHistoryList[i]) != true){
                allTestHistoryList.addAll(state.allTestHistoryList);
              }
            }
          }

          return Column(
            children: allTestHistoryList.isNotEmpty
              ? List<Widget>.generate(allTestHistoryList.length, (index) {
                  return Column(
                    children: [
                      ItemWidget(
                        size: size,
                        wColor: wColor,
                        onPressed: () {
                          BlocProvider.of<TestHistoryBloc>(context).add(
                              GetViewTestEvent(
                                  allTestHistoryList[index].id!.oid!));
                          popUpWidget(context);
                        },
                        textTestKit: allTestHistoryList[index].code!,
                      ),
                      SizedBox(height: size.height * 0.035),
                    ],
                  );
                })
              : [
                SizedBox(
                  height: size.height * 0.43,
                  width: double.infinity,
                  child: Center(
                    child: TextWidget(
                      text: "test_history_empty",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: wColor.mapColors["Black"],
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              ]
            );
        },
      ),
    );
  }

  Widget buildAntigenTest(Size size, ThemesIdx20 wColor) {
    return Visibility(
      visible: antigenTestHistoy,
      child: BlocBuilder<TestHistoryBloc, TestHistoryState>(
        builder: (context, state) {
          for (var i = 0; i < state.allTestHistoryList.length; i++) {
            if(state.allTestHistoryList[i].type!.type == "Antigen"){
              if(state.allTestHistoryList.contains(antigenTestHistoryList[i]) != true){
                antigenTestHistoryList.add(state.allTestHistoryList[i]);
              }
            }
          }

          return Column(
            children: antigenTestHistoryList.isNotEmpty
              ? List<Widget>.generate(antigenTestHistoryList.length, (index) {
                  return Column(
                    children: [
                      ItemWidget(
                        size: size,
                        wColor: wColor,
                        onPressed: () {
                          BlocProvider.of<TestHistoryBloc>(context).add(
                              GetViewTestEvent(
                                  antigenTestHistoryList[index].id!.oid!));
                          popUpWidget(context);
                        },
                        textTestKit: antigenTestHistoryList[index].code!,
                      ),
                      SizedBox(height: size.height * 0.035),
                    ],
                  );
                })
              : [
                SizedBox(
                  height: size.height * 0.43,
                  width: double.infinity,
                  child: Center(
                    child: TextWidget(
                      text: "test_history_empty",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: wColor.mapColors["Black"],
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              ]
            );
        },
      ),
    );
  }

  Widget buildPCRTest(Size size, ThemesIdx20 wColor) {
    return Visibility(
      visible: pcrTestHistory,
      child: BlocBuilder<TestHistoryBloc, TestHistoryState>(
        builder: (context, state) {
          for (var i = 0; i < state.allTestHistoryList.length; i++) {
            if(state.allTestHistoryList[i].type!.type == "PCR"){
              if(state.allTestHistoryList.contains(pcrTestHistoryList[i]) != true){
                pcrTestHistoryList.add(state.allTestHistoryList[i]);
              }
              else{
                pcrTestHistoryList.length;
              }
            }
          }

          return Column(
            children: pcrTestHistoryList.isNotEmpty
              ? List<Widget>.generate(pcrTestHistoryList.length, (index) {
                  return Column(
                    children: [
                      ItemWidget(
                        size: size,
                        wColor: wColor,
                        onPressed: () {
                          BlocProvider.of<TestHistoryBloc>(context).add(
                              GetViewTestEvent(
                                  pcrTestHistoryList[index].id!.oid!));
                          popUpWidget(context);
                        },
                        textTestKit: pcrTestHistoryList[index].code!,
                      ),
                      SizedBox(height: size.height * 0.035),
                    ],
                  );
                })
              : [
                SizedBox(
                  height: size.height * 0.43,
                  width: double.infinity,
                  child: Center(
                    child: TextWidget(
                      text: "test_history_empty",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: wColor.mapColors["Black"],
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              ]
            );
        },
      ),
    );
  }
}
