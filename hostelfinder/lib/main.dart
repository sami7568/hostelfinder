 import 'package:hostelfinder/adminPanel/meta/hooks/hook.dart';
import 'package:hostelfinder/hostlefinder/meta/hooks/hook.dart';
import 'package:hostelfinder/select.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String? usertype="a";
  @override
  Widget build(BuildContext context) {
    getUser();
    return usertype == "user"? body1(): usertype=="admin"? body2(): body3();
  }

  body1(){return  MaterialApp(
    // initialRoute: ,
      debugShowCheckedModeBanner: false,
      home: UserStartView()
  );}
  body3(){return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PromptScreen()
  );}
  body2(){return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminStartView()
  );}
  @override
  void initState() {
    getUser();
    super.initState();
  }
  getUser()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String? gettype = await sharedPreferences.getString(AppData.usertype!);
    setState(() {
      usertype = gettype;
    });
}
}

