import 'package:flutter/material.dart';
import 'package:personal_project/common_ui/common_widgets/separator_widget.dart';

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
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.person,
                  size: 70,
                ),
                SizedBox(height: 10),
                Text('Drawer Header'),
              ],
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
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
          ListTile(
            title: const Text('Item 2'),
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
          ListTile(
            title: const Text('Item 3'),
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
          ListTile(
            title: const Text('Item 4'),
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
          const Spacer(),
          Padding(
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
                const Text(
                  'Logout',
                  style: TextStyle(fontSize: 14),
                )
              ],
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
