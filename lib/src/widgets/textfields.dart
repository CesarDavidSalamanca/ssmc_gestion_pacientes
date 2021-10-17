import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';

class StreamTextField extends StatefulWidget {
  final Stream<String> textStream;
  final Function(String) changeStream;
  final String hintText;
  final String labelText;
  final String counterText;
  final bool enable;
  final String initialValue;
  final String icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final FontWeight labelFontWeight;
  final Widget button;

  StreamTextField(
      {@required this.textStream,
      @required this.changeStream,
      this.hintText = '',
      this.labelText = '',
      this.counterText = '',
      this.icon,
      this.enable = true,
      this.initialValue = "",
      this.keyboardType,
      this.obscureText = false,
      this.labelFontWeight = FontWeight.w500,
      this.button});

  @override
  _StreamTextFieldState createState() => _StreamTextFieldState();
}

class _StreamTextFieldState extends State<StreamTextField> {
  final TextEditingController _textEditingController = TextEditingController();
  bool obscureText;
  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width * 0.16;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    _textEditingController.text = widget.initialValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
              fontSize: height * 0.19,
              fontWeight: widget.labelFontWeight,
              color: currentTheme.dividerColor),
        ),
        SizedBox(
          height: height * 0.075,
        ),
        StreamBuilder(
            stream: widget.textStream,
            builder: (context, snapshot) {
              return Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextField(
                    style: TextStyle(
                        fontSize: height * 0.2,
                        color: currentTheme.textTheme.bodyText1.color),
                    controller: _textEditingController,
                    enabled: widget.enable,
                    keyboardType: widget.keyboardType,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      prefixIconConstraints: widget.button == null
                          ? null
                          : BoxConstraints(
                              minHeight: height * 0.75,
                              minWidth: height * 1.35),
                      prefixIcon: widget.button != null
                          ? widget.button
                          : widget.icon == null
                              ? null
                              : Container(
                                  // width: height * 0.8,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(),
                                      SizedBox(),
                                      SvgPicture.asset(
                                        widget.icon,
                                        width: height * 0.2,
                                        color: currentTheme.dividerColor,
                                      ),
                                      // Icon(
                                      //   widget.icon,
                                      //   size: height * 0.25,
                                      //   color: currentTheme.dividerColor,
                                      // ),
                                      SizedBox(),
                                      SizedBox(),
                                      Container(
                                        height: height * 0.4,
                                        width: 0.5,
                                        color: currentTheme.dividerColor,
                                      ),
                                      SizedBox(),
                                    ],
                                  ),
                                ),
                      fillColor: currentTheme.secondaryHeaderColor,
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.all(height * 0.2),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.5),
                          borderSide: BorderSide.none),
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: Colors.grey),
                      // labelText: labelText,
                      errorText: snapshot.error,
                      counterText: widget.counterText,
                      errorStyle: TextStyle(
                          fontSize: height * 0.2, height: height * 0.014),
                    ),
                    onChanged: (value) {
                      widget.changeStream(value);
                    },
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class DropDownElement {
  String text;
  String label;
  DropDownElement({this.text, this.label});
}

class StreamTextFieldWithCheckBox extends StatelessWidget {
  final Stream<String> textStream;
  final Function(String) changeStream;
  final Stream<String> dropBoxStream;
  final Function(String) changeDropBoxStream;
  final List<DropDownElement> dropDownElements;
  final String hintText;
  final String labelText;
  final String counterText;
  final bool enable;
  final String initialValue;
  final String icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final FontWeight labelFontWeight;

  const StreamTextFieldWithCheckBox({
    @required this.textStream,
    @required this.changeStream,
    @required this.dropBoxStream,
    @required this.changeDropBoxStream,
    @required this.dropDownElements,
    this.hintText = '',
    this.labelText = '',
    this.counterText = '',
    this.icon,
    this.enable = true,
    this.initialValue = "",
    this.keyboardType,
    this.obscureText = false,
    this.labelFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final height = MediaQuery.of(context).size.width * 0.16;
    final maxWidth = height * 1.35;
    final maxHeight = height * 0.75;
    Widget button = Container(
      width: maxWidth,
      height: maxHeight,
      child: Row(
        children: [
          Container(
              width: maxWidth * 0.45,
              height: maxHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: currentTheme.primaryColorLight,
                  boxShadow: [
                    BoxShadow(
                        color: currentTheme.dividerColor.withOpacity(0.5),
                        blurRadius: height * 0.05,
                        spreadRadius: height * 0.01)
                  ]),
              child: PopupMenuButton<String>(
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: maxHeight * 0.6,
                  color: currentTheme.dividerColor,
                ),
                itemBuilder: (context) => [
                  for (var item in dropDownElements)
                    PopupMenuItem(
                      child: Text(item.label),
                      value: item.text,
                    ),
                ],
                onSelected: (value) {
                  changeDropBoxStream(value);
                },
              )
              /*  Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  onTap: () {

                  },
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: maxHeight * 0.6,
                    color: currentTheme.dividerColor,
                  )),
            ), */
              ),
          Expanded(
              child: StreamBuilder<String>(
                  stream: dropBoxStream,
                  initialData: "",
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: currentTheme.dividerColor,
                          fontSize: height * 0.22,
                          fontWeight: FontWeight.w600),
                    );
                  }))
        ],
      ),
    );
    return StreamTextField(
      textStream: textStream,
      changeStream: changeStream,
      hintText: hintText,
      labelText: labelText,
      counterText: counterText,
      enable: enable,
      initialValue: initialValue,
      icon: icon,
      keyboardType: keyboardType,
      obscureText: obscureText,
      labelFontWeight: labelFontWeight,
      button: button,
    );
  }
}
