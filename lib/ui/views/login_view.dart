import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:providerarch/ui/widgets/login_header.dart';

import '../../viewmodels/login_view_model.dart';
import '../shared/shared_style.dart';

class LoginView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(
                controller: controller,
              ),
              FlatButton(
                color: Colors.white,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  var loginSuccess = await model.login(controller.text);
                  if (loginSuccess) {
                    // Navigate to the home page
                    Navigator.pushNamed(context, '/');
                  }
                },
              )
            ],
          )),
    );
  }
}
