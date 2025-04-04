import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/screens/signup_screen.dart';
import 'package:mobile/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login() async {
    // Récupérer les valeurs des champs de texte
    String email = _emailController.text;
    String password = _passwordController.text;

    // Simuler une vérification des informations d'identification
    if (email != '' && password != '') {
      var data = await ApiService.postData(
        'auth/login',
        {
          "email": email,
          "password": password,
        },
      );

      // Si les informations d'identification sont valides, stocker le token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = await prefs.setString('token', data['token']);

      if (token) {
        // Naviguer vers l'écran principal après la connexion réussie
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ), // Remplacez par votre écran principal
        );
      } else {
        // Afficher un message d'erreur si les informations d'identification sont incorrectes
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      }
    } else {
      // Afficher un message d'erreur si les informations d'identification sont incorrectes
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'Email address', hintText: 'Enter your email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password', hintText: '**********'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(value: false, onChanged: (bool? value) {}),
                Text('Remember me'),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('Forget password?'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                login();
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text('Login with ______'),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigation vers l'écran d'inscription
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text('Don\'t have an account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
