import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/show_alert_dialog.dart';
import 'package:flutter_app/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didReqSignOut = await showAlertDialog(context,
        title: 'Logout',
        content: 'Are you sure that you want to logout ?',
        cancelActionText: 'Cancel',
        defaultActionText: 'Logout');

    if (didReqSignOut == true) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
              onPressed: () => _confirmSignOut(context),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
