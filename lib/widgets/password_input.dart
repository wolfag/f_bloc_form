import 'package:f_bloc_form/bloc/my_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(builder: (context, state) {
      return TextFormField(
        initialValue: state.password.value,
        focusNode: focusNode,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock),
          helperText:
              '''Password should be at least 8 characters with at least one letter and number''',
          helperMaxLines: 2,
          labelText: 'Password',
          errorMaxLines: 2,
          errorText: state.password.invalid
              ? '''Password should be at least 8 characters with at least one letter and number'''
              : null,
        ),
        obscureText: true,
        onChanged: (value) {
          context.read<MyFormBloc>().add(PasswordChanged(password: value));
        },
        textInputAction: TextInputAction.done,
      );
    });
  }
}
