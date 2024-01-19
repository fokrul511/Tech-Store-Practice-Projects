import 'package:flutter/material.dart';
import 'package:tech_store/view/screen/desh_bord.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LogIn',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email', border: OutlineInputBorder()),
                  validator: (String? value) {
                    String v = value ?? "";
                    if (v.isEmpty) {
                      return ' Plesse Enter Your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passwordEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    String v = value ?? "";
                    if (v.isEmpty) {
                      return ' Plesse Enter Your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeshBordScreen(),
                            ));
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clear() {
    _passwordEditingController.clear();
    _emailEditingController.clear();
  }
}
