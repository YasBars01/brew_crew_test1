/*
  Widget that wraps the brew_list widget and settings form
  StatelessWidget
 */
import 'package:flutter/material.dart';
import 'package:brew_crew_test1/services/auth.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0, // no drop shadow
          title: Text('Welcome to Brew Crew!'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
            child: Text('Sign out anon'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ),
      );
    }

  }
}
/*

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

}
*/

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0, // no drop shadow
        title: Text('Sign in to Brew Crew!'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
            child: Text('Sign in anon'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null){
                print('error signing in');

              } else {
                print('sign in success');
                print(result.uid);
              }
            }
        ),
      ),
    );
  }
}


