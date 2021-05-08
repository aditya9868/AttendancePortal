import 'package:attend/index.dart';

class LoginProvider with ChangeNotifier {
  Future<BaseResponse> login(LoginModel login) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: login.userName, password: login.password);
      return BaseResponse(message: "login Successful", isSuccess: true);
    } on FirebaseAuthException catch (e) {
      return BaseResponse(message: e.message);
    } catch (e) {}
  }
}
