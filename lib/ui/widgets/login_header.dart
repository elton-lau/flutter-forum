import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:providerarch/ui/shared/shared_style.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;

  LoginHeader({this.controller, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Login',
          style: headerStyle,
        ),
        UIHelper.verticalSpaceSmall(),
        Text(
          'Enter a number 1 - 10',
          style: subHeaderStyle,
        ),
        LoginTextField(controller),
        this.validationMessage != null
            ? Text(
                validationMessage,
                style: TextStyle(color: Colors.red),
              )
            : Container(),
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;

  LoginTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: 'User Id'),
        controller: controller,
      ),
    );
  }
}
