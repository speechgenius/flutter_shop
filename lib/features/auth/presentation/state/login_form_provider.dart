import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'login_form_state.dart';

part 'login_form_provider.g.dart';

@riverpod
class LoginForm extends _$LoginForm {
  @override
  LoginFormState build() {
    return const LoginFormState();
  }

  void setEmail(String value) {
    state = state.copyWith(email: value);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }
}