import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
          child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 100,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, top: 40, right: 40.0, bottom: 20),
                    child: Text('Login',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Username',
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 30.0,
                ),
                const SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
                SizedBox(
                  width: 200.0,
                  height:50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                      onPressed: () {
                        print('Hello');
                      },
                      child: const Text('login')),
                ),
              ]
          )
      ),
    );
  }
}