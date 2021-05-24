import 'package:attend/index.dart';
import 'package:attend/users/teachers/dashboard/dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: LoginProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Credential(),
        ),
        ChangeNotifierProxyProvider<Credential, ViewAttendanceStudentProvider>(
            create: (context) => ViewAttendanceStudentProvider(),
            update: (context, cred, _) =>
                ViewAttendanceStudentProvider(cred: cred))
      ],
      child: Consumer<Credential>(
        builder: (context, cred, _) {
          // cred.logout();
          return FutureBuilder<bool>(
              future: cred.tryAutoLogin(),
              builder: (context, snapshot) {
                return MaterialApp(
                  theme: ThemeData(
                    fontFamily: "Raleway",
                    accentColor: AppColor.cyan,
                  ),
                  routes: {},
                  home: cred.isLogin
                      ? cred.userCredential.role == "student"
                          ? Dashboard()
                          : TeacherDashboard() //change to dashboard
                      : snapshot.connectionState == ConnectionState.waiting
                          ? LoadingScreen()
                          : Login(),
                );
              });
        },
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
