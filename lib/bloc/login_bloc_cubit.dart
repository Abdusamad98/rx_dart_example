import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LoginScreenBloc {
  final _userNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _integerController = PublishSubject<int>();


  Stream<int> get getIntegers => _integerController.stream;

  Stream<String> get userNameStream => _userNameController.stream;

  Stream<String> get passwordStream => _passwordController.stream;

  int k = 0;

  void increment() {
    k++;
    _integerController.sink.add(k);
  }


  void decrement() {
    k--;
    _integerController.sink.add(k);
  }


  void clearStreams() {
    updateUserName('');
    updatePassword('');
  }

  void updateUserName(String userName) {
    if (userName.length < 4) {
      _userNameController.sink
          .addError("Please enter at least 4 characters of your name here");
    } else {
      _userNameController.sink.add(userName);
    }
  }

  void updatePassword(String password) {
    if (password.length < 4) {
      _passwordController.sink
          .addError("Please enter at least 4 character of the password here");
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm => Rx.combineLatest2(
        userNameStream,
        passwordStream,
        (a, b) => true,
      );
}
