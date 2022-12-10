import 'package:dvm/app/api/auth_controller.dart';
import 'package:dvm/app/screens/dashbourd.dart';
import 'package:dvm/app/screens/splash_screen.dart';
import 'package:dvm/app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (create) => AuthC())],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: AppColors.PrimaryColor,
          //   primaryColor: Colors.lightBlue,
        ),
        color: const Color.fromARGB(255, 96, 216, 10),
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser != null)
            ? const Dashbourd()
            : const SplashScreen(),
      ),
    );
  }
}

// are bhai pata he ye muje kab yaad aaya subhje jab me 3:34 miniut pe soch rha tha ke itna code krne ke bad b output kyu nai mila
// fir muje ye yaad aaya bro soorrry  bro np lyt lo hote reita 

//badha ni alag file banani su
// app run thay che