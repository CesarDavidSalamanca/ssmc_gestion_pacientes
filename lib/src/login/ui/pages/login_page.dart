import 'package:ssmc_gestion_pacientes/src/launcher_page/launcher_page.dart';
import 'package:ssmc_gestion_pacientes/src/login/bloc/login_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/buttons.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/snackbar.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static final String pageRoute = "login";
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool firstBuild;
  LoginBloc loginBloc;
  @override
  void initState() {
    super.initState();
    firstBuild = true;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (firstBuild) {
      loginBloc = LoginBloc();
      firstBuild = false;
    }
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return BlocProvider(
      bloc: loginBloc,
      child: Scaffold(
          body: width <= 600
              ? _PortraitView(width: width, currentTheme: currentTheme)
              : _WebView(width: width, currentTheme: currentTheme)),
    );
  }
}

class _PortraitView extends StatelessWidget {
  const _PortraitView({
    Key key,
    @required this.width,
    @required this.currentTheme,
  }) : super(key: key);

  final double width;
  final ThemeData currentTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: [
          // Image.asset("assets/img/FONDO-AZUL.png", width: width),
          // Positioned(
          //   top: width * 0.2,
          //   left: width * 0.3,
          //   child: Image.asset(
          //     "assets/img/LOGO-LOGIN.png",
          //     width: width * 0.4,
          //   ),
          // ),
          Positioned(
            top: width * 0.6,
            left: width * 0.175,
            child: Container(
              width: width * 0.65,
              child: Text(
                "Aplicación móvil de gestión de finanzas para microempresarios",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: currentTheme.primaryColorLight,
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            width: width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: width * 0.3),
                Text(
                  "Observatorio municipal de salud mental de Cajamarca",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: currentTheme.dividerColor,
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: width * 0.05),
                _CardLogin(
                  width: width,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _WebView extends StatelessWidget {
  const _WebView({
    Key key,
    @required this.width,
    @required this.currentTheme,
  }) : super(key: key);

  final double width;
  final ThemeData currentTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Stack(
        children: [
          // Image.asset("assets/img/FONDO-AZUL.png", width: width),
          // Positioned(
          //   top: width * 0.2,
          //   left: width * 0.3,
          //   child: Image.asset(
          //     "assets/img/LOGO-LOGIN.png",
          //     width: width * 0.4,
          //   ),
          // ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.1),
            width: width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  "Observatorio municipal de salud mental de Cajamarca",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: currentTheme.dividerColor,
                      fontSize: 600 * 0.035,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 600 * 0.05),
                _CardLogin(
                  width: 600,
                ),
                SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CardLogin extends StatefulWidget {
  final double width;
  const _CardLogin({
    Key key,
    @required this.width,
  }) : super(key: key);

  @override
  __CardLoginState createState() => __CardLoginState();
}

class __CardLoginState extends State<_CardLogin> {
  Widget emailTextfield;
  Widget passwordTextfield;
  bool firstBuild = false;
  @override
  void initState() {
    firstBuild = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.width;
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    if (firstBuild) {
      firstBuild = false;
      emailTextfield = StreamTextField(
        labelText: "Correo electrónico",
        textStream: loginBloc.emailStream,
        changeStream: loginBloc.changeEmail,
        // icon: "assets/svg/mail.svg",
        hintText: 'ejemplo@gmail.com',
        keyboardType: TextInputType.emailAddress,
        initialValue: loginBloc.email,
      );
      passwordTextfield = StreamTextField(
        labelText: "Contraseña",
        textStream: loginBloc.passwordStream,
        changeStream: loginBloc.changePassword,
        // icon: "assets/svg/key.svg",
        hintText: '* * * * * * * *',
        obscureText: true,
        initialValue: loginBloc.password,
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.1, vertical: width * 0.075),
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[700].withOpacity(0.5),
              blurRadius: 15,
              spreadRadius: 0.5,
              offset: Offset(0, 10))
        ],
        color: currentTheme.primaryColorLight,
      ),
      child: Column(
        children: [
          Text(
            "Iniciar Sesión",
            style: TextStyle(
                color: currentTheme.primaryColor,
                fontSize: width * 0.05,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: width * 0.04),
          emailTextfield,
          SizedBox(height: width * 0.04),
          passwordTextfield,
          SizedBox(height: width * 0.06),
          Container(
            width: width,
            height: width * 0.08,
            child: ButtonRounded(
              onTap: () async {
                final response = await loginBloc.loginAccess(onFailure);
                if (response)
                  Navigator.popAndPushNamed(context, LauncherPage.pageRoute);
              },
              text: 'Ingresar',
              fontSize: width * 0.045,
            ),
          ),
        ],
      ),
    );
  }

  onFailure(String message) {
    double width = MediaQuery.of(context).size.width;
    if (widget.width > 600) {
      if (widget.width > 900) {
        width = ((widget.width - 251) / 2) * 0.9;
      } else
        width = (widget.width - 250) * 0.8;
    } else {
      width = widget.width * 0.8;
    }
    ThemeData currentTheme =
        Provider.of<ThemeChanger>(context, listen: false).currentTheme;
    final snackBar = mySnackBarError(width, currentTheme, message);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
