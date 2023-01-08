// // ignore_for_file: always_put_required_named_parameters_first

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:personal_project/icons/icons.dart';
// import 'package:personal_project/navigationBar/bloc/navigation_bar_bloc.dart';

// class CustomBottomAppBar extends StatefulWidget {
//   const CustomBottomAppBar({Key? key, this.index = 0}) : super(key: key);

//   final int index;

//   @override
//   State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
// }

// class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
//   @override
//   void initState() {
//     super.initState();
//     index = widget.index;
//   }

//   late int index;

//   @override
//   Widget build(BuildContext context) {
//     NavigationBarBloc navigationBloc =
//         BlocProvider.of<NavigationBarBloc>(context);
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey,
//         ),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: BlocBuilder<NavigationBarBloc, NavigationBarState>(
//         builder: (context, state) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SwitchButtonStyle(
//                 onPressed: () {
//                   index = 0;
//                   navigationBloc.add(PageChanged(indexNavigation: index));
//                 },
//                 indexPosition: state.indexNavigation,
//                 indexButton: 0,
//                 buttonName: 'Home',
//                 iconRoute: IconsFolderCovid.home,
//               ),
//               SwitchButtonStyle(
//                 onPressed: () {
//                   index = 1;

//                   navigationBloc.add(PageChangedNavigation(index));
//                 },
//                 indexPosition: state.indexNavigation,
//                 indexButton: 1,
//                 buttonName: 'Antigen',
//                 iconRoute: IconsFolderCovid.home,
//               ),
//               SwitchButtonStyle(
//                   onPressed: () {
//                     index = 2;
//                     navigationBloc.add(PageChangedNavigation(index));
//                   },
//                   indexPosition: state.indexNavigation,
//                   indexButton: 2,
//                   buttonName: 'PCR',
//                   iconRoute: IconsFolderCovid.home),
//               SwitchButtonStyle(
//                   onPressed: () {
//                     index = 3;
//                     navigationBloc.add(PageChangedNavigation(index));
//                   },
//                   indexPosition: state.indexNavigation,
//                   indexButton: 3,
//                   buttonName: 'History',
//                   iconRoute: IconsFolderCovid.home),
//               SwitchButtonStyle(
//                 onPressed: () {
//                   index = 3;
//                   navigationBloc.add(PageChangedNavigation(index));
//                 },
//                 indexPosition: state.indexNavigation,
//                 indexButton: 3,
//                 buttonName: 'FAQs',
//                 iconRoute: IconsFolderCovid.home,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class SwitchButtonStyle extends StatelessWidget {
//   const SwitchButtonStyle({
//     Key? key,
//     required this.indexPosition,
//     required this.indexButton,
//     required this.buttonName,
//     required this.onPressed,
//     required this.iconRoute,
//   }) : super(key: key);

//   final int indexPosition;
//   final int indexButton;
//   final String buttonName;
//   final String iconRoute;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 56,
//       child: indexPosition == indexButton
//           ? SelectedButton(
//               buttonName: buttonName,
//               iconRoute: iconRoute,
//               onPressed: onPressed,
//             )
//           : UnselectedButton(
//               iconRoute: iconRoute,
//               onPressed: onPressed,
//             ),
//     );
//   }
// }

// class SelectedButton extends StatelessWidget {
//   const SelectedButton({
//     Key? key,
//     required this.buttonName,
//     required this.onPressed,
//     required this.iconRoute,
//   }) : super(key: key);

//   final String buttonName;
//   final VoidCallback onPressed;
//   final String iconRoute;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Transform.translate(
//           offset: const Offset(0, -30),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [
//                 FloatingActionButton(
//                   backgroundColor: Colors.black,
//                   onPressed: onPressed,
//                   child: ImageIcon(
//                     AssetImage(iconRoute),
//                     size: 22,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Column(
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Text(
//               buttonName,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class UnselectedButton extends StatelessWidget {
//   const UnselectedButton({
//     Key? key,
//     required this.onPressed,
//     required this.iconRoute,
//   }) : super(key: key);

//   final VoidCallback onPressed;
//   final String iconRoute;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: ImageIcon(AssetImage(iconRoute)),
//       color: Colors.grey,
//     );
//   }
// }
