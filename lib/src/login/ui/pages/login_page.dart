import 'package:ssmc_gestion_pacientes/src/login/bloc/login_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/buttons.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static final String pageRoute = "login";
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return BlocProvider(
      bloc: LoginBloc(),
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Image.asset("assets/img/FONDO-AZUL.png", width: width),
            Positioned(
              top: width * 0.2,
              left: width * 0.3,
              child: Image.asset(
                "assets/img/LOGO-LOGIN.png",
                width: width * 0.4,
              ),
            ),
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
                  SizedBox(height: width * 0.6),
                  Text(
                    "Aplicación móvil de gestión de finanzas para microempresarios",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.transparent,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: width * 0.05),
                  _CardLogin(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _CardLogin extends StatefulWidget {
  const _CardLogin({
    Key key,
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
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final width = MediaQuery.of(context).size.width;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    if (firstBuild) {
      firstBuild = false;
      emailTextfield = StreamTextField(
        labelText: "Correo electrónico",
        textStream: loginBloc.emailStream,
        changeStream: loginBloc.changeEmail,
        icon: "assets/svg/mail.svg",
        hintText: 'ejemplo@gmail.com',
        keyboardType: TextInputType.emailAddress,
      );
      passwordTextfield = StreamTextField(
        labelText: "Contraseña",
        textStream: loginBloc.passwordStream,
        changeStream: loginBloc.changePassword,
        icon: "assets/svg/key.svg",
        hintText: '* * * * * * * *',
        obscureText: true,
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
            height: width * 0.1,
            child: ButtonRounded(
              onTap: () async {
                final response = await loginBloc.loginAccess(() {}, () {});
                // if (response)
                //   Navigator.pushNamed(context, UserProfilePage.pageRoute);
              },
              text: 'Ingresar',
              fontSize: width * 0.05,
            ),
          ),
          SizedBox(height: width * 0.08),
          Container(
            width: width,
            height: width * 0.1,
            child: ButtonRounded(
              onTap: () {
                // Navigator.pushNamed(context, RegisterPage.pageRoute);
              },
              text: 'Registrarse',
              fontSize: width * 0.05,
              buttonColor: currentTheme.accentColor,
              textColor: currentTheme.primaryColor,
            ),
          ),
          SizedBox(height: width * 0.06),
          FittedBox(
            child: MyTextButton(
              text: "¿Olvidó su contraseña?",
              onPressed: () {
                // Navigator.pushNamed(context, RecoveryPasswordPage.pageRoute);
              },
              fontSize: width * 0.045,
            ),
          ),
        ],
      ),
    );
  }
}
