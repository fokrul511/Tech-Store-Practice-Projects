import 'package:flutter/material.dart';
import 'package:tech_store/view/screen/log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
Future.delayed(Duration(seconds: 2)).then((value){
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ));
});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage('images/computer.jpeg'),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 1)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('Tech Store',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
