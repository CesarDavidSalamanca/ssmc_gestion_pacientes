import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/bloc/appBloc.dart';
import 'package:ssmc_gestion_pacientes/src/login/ui/pages/login_page.dart';
import 'package:ssmc_gestion_pacientes/src/routes/routes.dart';
import 'package:ssmc_gestion_pacientes/src/share_prefs/user_prefs.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserPrefs userPrefs = UserPrefs();
  await userPrefs.initPrefs();
  // await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => {
            runApp(ChangeNotifierProvider(
              create: (_) => ThemeChanger(1),
              child: BlocProvider(bloc: AppBloc(), child: MyApp()),
            ))
          });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Material App',
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: LoginPage.pageRoute,
    );
  }
}
