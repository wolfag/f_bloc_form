import 'package:f_bloc_form/bloc/my_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(builder: (context, state) {
      return TextFormField(
        initialValue: state.email.value,
        focusNode: focusNode,
        decoration: InputDecoration(
          icon: const Icon(Icons.email),
          labelText: 'Email',
          helperText: 'A complete, valid email e.g. joe@gmail.com',
          errorText: state.email.invalid
              ? 'Please ensure the email entered is valid'
              : null,
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          context.read<MyFormBloc>().add(EmailChanged(email: value));
        },
        textInputAction: TextInputAction.next,
      );
    });
  }
}
