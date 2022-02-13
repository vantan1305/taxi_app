import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FileAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void singUp(String name, String email, String phone, String pass,
      Function onSuccsess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _creatUser(user.user!.uid, name, phone, onSuccsess);
      print(user);
    }).catchError((err) {});
  }

  _creatUser(String userId, String name, String phone, Function onSuccsess) {
    var user = {'name': name, 'phone': phone};
    var ref = FirebaseDatabase.instance.reference().child('users');
    ref.child(userId).set(user).then((user) {}).catchError((err) {
      onSuccsess();
    });
  }
}
