import 'package:brew_crew_test1/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
        title: Text('Register to Brew Crew!'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
              }
          )
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(                                                      // Email
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Please enter your email';
                  } else {
                    return null;
                  }
                },
                onChanged: (val){
                  setState(() => email = val);
                },
                decoration: InputDecoration(
                    hintText: "Email"
                ),

              ),
              SizedBox(height: 20.0,),
              TextFormField(                                                      // Password
                validator: (val) => val.length < 6 ? 'Enter a password 6+ characters long' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                },
                decoration: InputDecoration(
                    hintText: "Password"
                ),

              ),
              SizedBox(height: 20.0,),
              RaisedButton(                                                       // Submit button
                color: Colors.brown[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    print(email);
                    print(password);
                  } else {

                  }
                },
              ),

            ],
          ),
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
