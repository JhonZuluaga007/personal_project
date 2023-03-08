import 'package:Tellme/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'info_container_widget.dart';

class InfoColumnWidget extends StatelessWidget {
  const InfoColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final DateFormat formatter = DateFormat('MM-dd-yyyy');

        return Column(
          children: [
            //TODO translate hintText
           InfoContainerWidget(
              hintText: 'First name',
              text: state.name!,
            ),
            SizedBox(height: size.height * 0.015),
            InfoContainerWidget(
              hintText: 'Middle name',
              text: state.middleName ?? 'Middle name',
            ),
            SizedBox(height: size.height * 0.015),
            InfoContainerWidget(
              hintText: 'Last name',
              text: state.lastname ?? 'Last name',
            ),
            SizedBox(height: size.height * 0.015),
            InfoContainerWidget(
              hintText: 'Date of birth',
              text: state.dateOfBirth != null
                  ? formatter.format(state.dateOfBirth!.date)
                  : 'mm/dd/yyyy',
              icon: Icons.calendar_month,
            ),
            SizedBox(height: size.height * 0.015),
            InfoContainerWidget(
              hintText: 'Phone number',
              text: state.cellphone.toString(),
            ),
            SizedBox(height: size.height * 0.015),
            InfoContainerWidget(
              hintText: 'Email Address',
              text: state.email ?? 'test@test.com',
            ),
          ],
        );
      },
    );
  }
}
