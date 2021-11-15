import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/auth/firebase_auth.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/pages/locate_patient_page.dart';
import 'package:ssmc_gestion_pacientes/src/routes/routes.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(height: 20),
            SafeArea(
              child: Container(
                // padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Container(
                    width: 200,
                    // color: Colors.pink,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getUserName(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          getUserEmail(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(height: 10),
            Expanded(child: ListaOpciones()),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline, color: accentColor),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                    value: appTheme.darkTheme,
                    onChanged: (value) {
                      appTheme.darkTheme = value;
                    },
                    activeColor: appTheme.currentTheme.accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, i) => ListTile(
        leading: Icon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.accentColor,
        ),
        onTap: () {
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.title = pageRoutes[i].titulo;
          layoutModel.currentPage = pageRoutes[i].page;
        },
      ),
    );
  }
}

class LayoutModel with ChangeNotifier {
  Widget _currentPage = LocatePatientPage();
  set currentPage(Widget page) {
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;
  String _title = "Ubicar Paciente";
  set title(String title) {
    this._title = title;
    notifyListeners();
  }

  String get title => this._title;
}
