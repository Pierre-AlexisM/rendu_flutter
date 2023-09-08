import 'package:flutter/material.dart';
import '../model/user.dart';
import '../utils/functions.dart';
import '../database/data_base.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _userPassword = '';

  int userIDCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page de Connexion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                '../../assets/Am-liorer-sa-connexion-internet.jpg',
                width: 400.0,
                height: 250.0,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _userName = value;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer votre nom d\'utilisateur';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nom d\'utilisateur',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _userPassword = value;
                  });
                },
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  login(context, _formKey, _userName, _userPassword, userIDCounter);
                },
                child: Text('Connexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}