import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/text/text_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Importante: elimine cualquier padding del ListView.
        // padding: EdgeInsets.zero,
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
                children: const [
                  Icon(
                    Icons.person,
                    size: 70,
                  ),
                  SizedBox(height: 10),
                  Text('Mateo Bonnett'),
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
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              thickness: 1,
              height: 2,
            ),
          ),
          // ListTile(
          //   title: const Text('Item 4'),
          //   onTap: () {
          //     // Actualiza el estado de la aplicación
          //     // ...
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'login');
              //TODO RESTART BAR
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
          SizedBox(
            height: size.height * 0.03,
          )
        ],
      ),
    );
  }
}
