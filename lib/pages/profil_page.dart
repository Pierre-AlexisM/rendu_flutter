// lib/model/user.dart
import 'package:flutter/material.dart';
import '../database/data_base.dart';
import '../utils/functions.dart';
import '../model/user.dart';

class UserInformationPage extends StatelessWidget {
  final int userID;
  final String userName;
  final String userPassword;

  UserInformationPage({
    required this.userID,
    required this.userName,
    required this.userPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations de l\'Utilisateur'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Text(
              'Bonjour $userName',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Mettez ici le traitement lorsque le bouton de l'ID est cliqué
                },
                child: Text('ID: $userID'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Mettez ici le traitement lorsque le bouton du nom d'utilisateur est cliqué
                },
                child: Text('$userName'),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  final dbHelper = DatabaseHelper.instance;
                  User user = User(id: userID, name: userName, password: userPassword);
                  int userId = await dbHelper.insertUser(user);

                  if (userId != null) {
                    // Affichez un message de réussite ou effectuez d'autres actions après l'enregistrement.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Données utilisateur enregistrées avec succès.'),
                      ),
                    );
                  } else {
                    // Gérez l'échec de l'enregistrement ici.
                  }
                },
                child: Text('Enregistrer'),
              ),
              ElevatedButton(
                onPressed: () {
                  updateUser(context, userName, userPassword);
                },
                child: Text('Mettre à jour'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}