import 'package:Tellme/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Tellme/common_ui/common_widgets/text/text_widget.dart';
import '../../features/medical_history/presentation/bloc/medical_history_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final stateUserId = BlocProvider.of<AuthBloc>(context).state;

    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: const DividerThemeData(color: Colors.transparent),
            ),
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person, // TODO GET IMAGE FROM THE PROFILE.
                    size: 70,
                  ),
                  const SizedBox(height: 10),
                  TextWidget(
                    text: '${stateUserId.name} ${stateUserId.lastname}',
                    requiresTranslate: false,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 1,
              height: 2,
            ),
          ),
          ListTile(
            trailing: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.person),
            ),
            title: const TextWidget(
              text: 'drawer_item_one',
            ),
            onTap: () {
              // Actualiza el estado de la aplicación

              Navigator.pushNamed(context, 'profile');
              // ...
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 1,
              height: 2,
            ),
          ),
          ListTile(
            trailing: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.history),
            ),
            title: const TextWidget(
              text: 'drawer_item_two',
            ),
            onTap: () {
              BlocProvider.of<MedicalHistoryBloc>(context).add(
                  GetMedicalHistoryEvent(stateUserId.userId!,
                      questions2: const []));
              Navigator.pushNamed(context, 'medicalHistory');
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 1,
              height: 2,
            ),
          ),
          ListTile(
            trailing: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.keyboard_alt_outlined),
            ),
            title: const TextWidget(
              text: 'drawer_item_three',
            ),
            onTap: () {
              // Actualiza el estado de la aplicación
              // ...
              Navigator.pushNamed(context, 'reset');
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 1,
              height: 2,
            ),
          ),
          //NOT USED AT THE MOMENT
          // ListTile(
          //   title: const TextWidget(
          //     text: 'support_text_one',
          //   ),
          //   trailing: const Padding(
          //     padding: EdgeInsets.only(right: 16.0),
          //     child: Icon(Icons.help_center),
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, 'support');
          //   },
          // ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Divider(
          //     thickness: 1,
          //     height: 2,
          //   ),
          // ),
          const Spacer(),
          WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: InkWell(
              onTap: () {
                authBloc.add(LogOut());

                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_outlined,
                      size: 24,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    const TextWidget(
                      text: 'drawer_item_four',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}
