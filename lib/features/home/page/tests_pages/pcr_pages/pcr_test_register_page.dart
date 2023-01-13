import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/common_ui/common_pages/my_app_scaffold_page.dart';

import '../../../../../navigationBar/bloc/navigation_bar_bloc.dart';
import '../../../widget/test_widgets/app_bar_widget.dart';

class PcrRegisterPage extends StatelessWidget {
  const PcrRegisterPage({super.key, this.isHomeNavigation});

  final bool? isHomeNavigation;

  @override
  Widget build(BuildContext context) {
    NavigationBarBloc navigationBloc =
        BlocProvider.of<NavigationBarBloc>(context);
    return MyAppScaffold(
      appBar: registerAppBarWidget(() {
        if (isHomeNavigation == true) {
          navigationBloc.add(PageChanged(indexNavigation: 0));
          Navigator.pushNamed(context, 'navBar');
        }
        if (isHomeNavigation == false) {
          navigationBloc.add(PageChanged(indexNavigation: 2));
          Navigator.pushNamed(context, 'navBar');
        }
      }, 'test_info_screen_text_two'),
      children: [],
    );
  }
}
