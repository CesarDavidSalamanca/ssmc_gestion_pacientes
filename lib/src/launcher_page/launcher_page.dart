import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/drawer_menu.dart';

class LauncherPage extends StatelessWidget {
  static final String pageRoute = "launcher_page";
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    double width = MediaQuery.of(context).size.width;
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(layoutModel.title),
        backgroundColor: appTheme.accentColor,
      ),
      drawer: MenuPrincipal(),
      // body: _ListaOpciones(),
      body: Row(
        children: [
          if (width > 600)
            Container(
              width: 250,
              height: double.infinity,
              child: ListaOpciones(),
            ),
          Container(
            width: 1,
            height: double.infinity,
            color: appTheme.primaryColorLight,
          ),
          Expanded(child: layoutModel.currentPage)
        ],
      ),
    );
  }
}
