import 'package:brew_crew_test1/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;      // passing the value to widget, not state
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0, // no drop shadow
        title: Text('Sign in to Brew Crew!'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              }
          )
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            TextFormField(                                                      // Email
              onChanged: (val){
                setState(() => email = val);
              },
              decoration: InputDecoration(
                  hintText: "Email"
              ),
              validator: (value) {
                if(value.isEmpty) {
                  return 'Please enter your email';
                }
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(                                                      // Password

              obscureText: true,
              onChanged: (val){
                setState(() => password = val);
              },
              decoration: InputDecoration(
                  hintText: "Password"
              ),
              validator: (val) {
                if(val.isEmpty) {
                  return 'Please enter your password';
                }
              },
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Colors.brown[400],
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
                onPressed: () async{
                  print(email);
                  print(password);
                },
            ),
  
          ],
        ),

       /* RaisedButton(
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
        ),*/
      ),
    );
  }
}
