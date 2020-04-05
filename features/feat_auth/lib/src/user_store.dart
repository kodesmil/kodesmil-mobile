import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final FirebaseAuth firebaseAuth;

  _UserStore(this.firebaseAuth);

  @action
  Future logout() async {
    await firebaseAuth.signOut();
  }
}