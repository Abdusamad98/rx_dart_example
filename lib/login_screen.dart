import 'package:flutter/material.dart';

import 'bloc/login_bloc_cubit.dart';
import 'custom_widgets/custom_plain_button.dart';
import 'custom_widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginScreenBloc _loginScreenBloc = LoginScreenBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation with BloC'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login In',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder(
                      stream: _loginScreenBloc.userNameStream,
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            CustomTextField(
                              onChange: (text) {
                                _loginScreenBloc.updateUserName(text);
                              },
                              labelText: 'Username',
                              textInputType: TextInputType.emailAddress,
                            ),
                            if (snapshot.hasError)
                              Text(snapshot.error.toString()),
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder(
                      stream: _loginScreenBloc.passwordStream,
                      builder: (context, snapshot) {
                        return Column(
                          children: [
                            CustomTextField(
                              onChange: (text) {
                                _loginScreenBloc.updatePassword(text);
                              },
                              labelText: 'Password',
                              textInputType: TextInputType.text,
                            ),
                            if (snapshot.hasError)
                              Text(snapshot.error.toString()),
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
              ElevatedButton(
                onPressed: () {
                  _loginScreenBloc.increment();
                },
                child: const Text("+"),
              ),
              ElevatedButton(
                onPressed: () {
                  _loginScreenBloc.decrement();
                },
                child: StreamBuilder(
                  stream: _loginScreenBloc.getIntegers,
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString());
                  },
                ),
              ),
              StreamBuilder(
                stream: _loginScreenBloc.validateForm,
                builder: (context, snapshot) {
                  return CustomPlainButton(
                    isEnabled: snapshot.hasData,
                    btnColor: snapshot.hasData ? Colors.red : Colors.grey,
                    height: 67,
                    onTap: snapshot.hasData
                        ? () {
                            print('Login Button Pressed');
                          }
                        : null,
                    label: 'Log in',
                    lblColor: Colors.white,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
