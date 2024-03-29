import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'info_container_widget.dart';
import '../../auth/presentation/bloc/auth_bloc.dart';

class InfoColumnWidget extends StatelessWidget {
  const InfoColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
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
                  ? state.dateOfBirth.toString()
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
