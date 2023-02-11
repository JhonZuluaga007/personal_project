import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'card_test_widget.dart';
import '../widgets/pop_up_widget.dart';
import '../../bloc/test_history_bloc.dart';
import '../../../../config/theme/theme.dart';
import '../../domain/entities/test_history_entity.dart';
import '../../../../common_ui/common_widgets/text/text_widget.dart';

class SearchDelegateWidget extends SearchDelegate {
  final wColor = ThemesIdx20();
  List<TestHistoryEntity> _filterTestHistoryList = [];
  final List<TestHistoryEntity> listTestHistoryState;

  SearchDelegateWidget({
    required this.listTestHistoryState,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = "",
          icon: Icon(Icons.clear, color: wColor.mapColors["P00"]))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, _filterTestHistoryList);
        },
        icon: Icon(Icons.arrow_back, color: wColor.mapColors["P00"]));
  }

  Widget _emptyContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Center(
          child: SizedBox(
        width: size.width * 0.4,
        height: size.height * 0.4,
        child: Center(
          child: TextWidget(
            text: "test_history_search_delegate",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: wColor.mapColors["Black"],
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
      )),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return _emptyContainer(context);
    }

    for (var i = 0; i < listTestHistoryState.length; i++) {
      _filterTestHistoryList = listTestHistoryState.where((testHistory) {
        return testHistory.code
            .toString()
            .toLowerCase()
            .contains(query.trim().toLowerCase(), 0);
      }).toList();
    }

    return ListView.builder(
        itemCount: _filterTestHistoryList.length,
        itemBuilder: (_, int index) {
          return ItemTestData(codeTest: _filterTestHistoryList[index].code!);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return _emptyContainer(context);
    }

    for (var i = 0; i < listTestHistoryState.length; i++) {
      _filterTestHistoryList = listTestHistoryState.where((testHistory) {
        return testHistory.code
            .toString()
            .toLowerCase()
            .contains(query.trim().toLowerCase(), 0);
      }).toList();
    }

    return ListView.builder(
        itemCount: _filterTestHistoryList.length,
        itemBuilder: (_, int index) {
          return ItemTestData(codeTest: _filterTestHistoryList[index].code!);
        });
  }
}

class ItemTestData extends StatelessWidget {
  final String codeTest;

  const ItemTestData({super.key, required this.codeTest});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<TestHistoryBloc, TestHistoryState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.040, vertical: size.height * 0.020),
            child: CardTestWidget(
              onPressed: () {
                popUpWidget(context);
              },
              textTestKit: codeTest,
            ),
          ),
        );
      },
    );
  }
}
