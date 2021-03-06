import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/email_sign_in_bloc_base.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(child: EmailSignInFormBlocBase.create(context))),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
