import 'dart:async';

import 'package:flutter_apptaxi/file_base/file_auth.dart';

class AuthBloc {
  var _fileAuth = FileAuth();
  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get passStream => _passController.stream;

  bool isValid(String name, String email, String phone, String pass) {
    if (name == null || name.length <= 3) {
      _nameController.sink.addError('Tên đăng ký phải trên 3 ký tự');
      return false;
    }
    _nameController.sink.add('');

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError('Số điện thoại không hợp lệ');
      return false;
    }
    _phoneController.sink.add('');

    if (email == 0 || email.length <= 3) {
      _emailController.sink.addError('Email không hợp lệ');
      return false;
    }
    _emailController.sink.add('');

    if (pass == 0 || pass.length <= 6) {
      _passController.sink.addError('Mật khẩu phải trên 6 ký tự');
      return false;
    }
    _passController.sink.add('');

    return true;
  }

  void sigUp(String name, String email, String phone, String pass,
      Function onSuccsess) {
    _fileAuth.singUp(name, email, phone, pass, onSuccsess);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _phoneController.close();
    _passController.close();
  }
}
