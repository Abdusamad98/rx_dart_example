import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'login_bloc_state.dart';

class LoginScreenCubit extends Cubit<LoginBloc> {
  LoginScreenCubit() : super(LoginInitial());

  final _userNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _integerController = PublishSubject<int>();

  Stream<int> get getIntegers => _integerController.stream;

  Stream<String> get userNameStream => _userNameController.stream;

  Stream<String> get passwordStream => _passwordController.stream;

  void addNumber(int number) {
    _integerController.sink.add(number);
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

  @override
  Future<void> close() {
    _integerController.close();
    return super.close();
  }
}
