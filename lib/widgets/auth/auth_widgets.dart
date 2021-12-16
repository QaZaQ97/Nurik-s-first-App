// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Login to your account'), centerTitle: true),
      body: ListView(
        children: const <Widget>[
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blueColor = Color.fromRGBO(1, 180, 228, 1);
    final textStyle = TextStyle(fontSize: 16.0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _FormWidget(),
          SizedBox(height: 28.0),
          Text(
              'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
              style: textStyle),
          TextButton(
            onPressed: () {},
            child: Text('Register'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(blueColor),
            ),
          ),
          SizedBox(height: 28.0),
          Text('If you signed up but didn\'t get your verification email.',
              style: textStyle),
          TextButton(
            onPressed: () {},
            child: Text('Verify email'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(blueColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _loginTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      print('correct');

Navigator.of(context).pushReplacementNamed('/main_screen');

    } else {
      errorText = 'Invalid login or/and Password';
      print('uncorrect');
    }
    setState(() {});
  }

  void _password() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final blueColor = Color.fromRGBO(1, 180, 228, 1);
    final textStyle = TextStyle(fontSize: 16.0, color: Color(0xFF212529));
    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.fromLTRB(12, 6, 12, 6),
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 26.0),
        if (errorText != null)
          ...[Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),SizedBox(height: 18),],
        Text('Username', style: textStyle),
        SizedBox(height: 6.0),
        TextField(
            controller: _loginTextController, decoration: textFieldDecoration),
        SizedBox(height: 16.0),
        Text('Password', style: textStyle),
        SizedBox(height: 6.0),
        TextField(
            controller: _passwordTextController,
            decoration: textFieldDecoration),
        SizedBox(height: 28.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _auth,
              child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(blueColor),
              ),
            ),
            SizedBox(width: 28.0),
            TextButton(
              onPressed: _password,
              child: Text('Reset password'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(blueColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
