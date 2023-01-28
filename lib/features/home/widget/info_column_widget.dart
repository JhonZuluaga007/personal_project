import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_project/features/auth/bloc/auth_bloc.dart';
import 'info_container_widget.dart';
import 'package:intl/intl.dart';

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
              text: state.birthDate != null
                  ? formatter.format(state.birthDate!.date!)
                  : 'mm/dd/yyyy',
              icon: Icons.calendar_month,
            ),
            SizedBox(height: size.height * 0.015),
            InfoContainerWidget(
              hintText: 'Phone number',
              text: state.cellphone ?? '000 000 000',
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
