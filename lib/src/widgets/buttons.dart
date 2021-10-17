import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';

class ButtonRounded extends StatelessWidget {
  const ButtonRounded(
      {Key key,
      @required this.text,
      @required this.onTap,
      @required this.fontSize,
      this.onDoubleTap,
      this.iconUrl,
      this.fontWeight = FontWeight.w700,
      this.buttonColor,
      this.textColor,
      this.splashColor,
      this.borderRadious = 10,
      this.shadow = false})
      : super(key: key);

  final double fontSize;
  final String text;
  final Function onTap;
  final String iconUrl;
  final Function onDoubleTap;
  final FontWeight fontWeight;
  final Color buttonColor;
  final Color textColor;
  final Color splashColor;
  final double borderRadious;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    Color primaryColor =
        buttonColor == null ? currentTheme.primaryColor : buttonColor;
    Color secondaryColor =
        buttonColor == null ? currentTheme.primaryColorLight : textColor;
    Color thirdColor =
        splashColor == null ? currentTheme.primaryColorDark : splashColor;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: onTap == null ? Colors.blueGrey : primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadious)),
          boxShadow: shadow
              ? [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: Colors.grey.withOpacity(0.5))
                ]
              : []),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: thirdColor,
          borderRadius: BorderRadius.circular(borderRadious),
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              iconUrl == null
                  ? Container()
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: fontSize * 0.7),
                      child: SvgPicture.asset(
                        iconUrl,
                        width: fontSize * 1.2,
                        color: secondaryColor,
                      )

                      // Icon(
                      //   icon,
                      //   color: secondaryColor,
                      //   size: fontSize * 1.2,
                      // ),
                      ),
              iconUrl == null
                  ? Container()
                  : Container(
                      height: fontSize * 1.5,
                      width: 1,
                      color: secondaryColor,
                    ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: fontWeight,
                      fontSize: fontSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.fontSize = 13,
      this.textColor,
      this.icon,
      this.fontWeight = FontWeight.w700})
      : super(key: key);
  final Function onPressed;
  final String text;
  final double fontSize;
  final Color textColor;
  final IconData icon;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    Color color;
    if (textColor == null) {
      color = Provider.of<ThemeChanger>(context).currentTheme.primaryColor;
    } else {
      color = textColor;
    }
    return TextButton(
        style: TextButton.styleFrom(
            primary: color,
            textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
            )),
        onPressed: onPressed,
        child: Row(
          children: [
            icon == null
                ? Container()
                : Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      icon,
                      color: color,
                      size: fontSize,
                    ),
                  ),
            Container(
                // padding: EdgeInsets.only(bottom: 1),
                // decoration: BoxDecoration(
                //     border: Border(bottom: BorderSide(color: color, width: 1))),
                child: Text(text)),
          ],
        ));
  }
}
