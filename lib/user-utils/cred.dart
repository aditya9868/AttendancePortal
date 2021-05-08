import 'package:attend/index.dart';

class Credential with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String userName;

  bool get isLogin {
    if (userName == null)
      return false;
    else
      return true;
  }

  Future<void> storeUserData(String usr) async {
    userName = usr;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', json.encode({"userName": userName}));
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    var p = prefs.getKeys();
    if (!prefs.containsKey('userData')) {
      return false;
    }

    final data =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    userName = data['userName'];

    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    userName = null;
    notifyListeners();
  }

  Stream<UserModel> get getusermsg {
    return _firebaseFirestore
        .collection("users")
        .doc(userName)
        .snapshots()
        .map((DocumentSnapshot groupdoc) {
      return UserModel.fromJson(groupdoc.data());
    });
  }
}
