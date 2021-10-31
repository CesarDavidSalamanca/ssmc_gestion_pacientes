import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/bloc/appBloc.dart';
import 'package:ssmc_gestion_pacientes/src/launcher_page/launcher_page.dart';
import 'package:ssmc_gestion_pacientes/src/login/ui/pages/login_page.dart';
import 'package:ssmc_gestion_pacientes/src/routes/routes.dart';
import 'package:ssmc_gestion_pacientes/src/share_prefs/user_prefs.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/drawer_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserPrefs userPrefs = UserPrefs();
  await userPrefs.initPrefs();
  // await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger(1)),
      ChangeNotifierProvider(create: (_) => LayoutModel()),
    ],
    child: BlocProvider(bloc: AppBloc(), child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Observatorio municipal de salud mental de Cajamarca',
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
      // initialRoute: LoginPage.pageRoute,
      initialRoute: LauncherPage.pageRoute,
    );
  }
}
