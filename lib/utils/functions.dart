import 'package:flutter/material.dart';
import '../pages/profil_page.dart';

void updateUser(BuildContext context, String userName, String userPassword) {
  String newUserName = userName;
  String newUserPassword = userPassword;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Mettre à jour les données'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                initialValue: userName,
                onChanged: (value) {
                  newUserName = value;
                },
                decoration: InputDecoration(labelText: 'Nouveau nom d\'utilisateur'),
              ),
              TextFormField(
                initialValue: userPassword,
                onChanged: (value) {
                  newUserPassword = value;
                },
                decoration: InputDecoration(labelText: 'Nouveau mot de passe'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Annuler'),
          ),
          TextButton(
            onPressed: () {

              Navigator.of(context).pop(); // Ferme la boîte de dialogue
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Données utilisateur mises à jour avec succès.'),
                ),
              );
            },
            child: Text('Enregistrer'),
          ),
        ],
      );
    },
  );
}

void login(BuildContext context, GlobalKey<FormState> formKey, String userName, String userPassword, int userIDCounter) {
  if (formKey.currentState!.validate()) {
    int generatedUserID = userIDCounter++;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserInformationPage(
          userID: generatedUserID,
          userName: userName,
          userPassword: userPassword,
        ),
      ),
    );
  }
}