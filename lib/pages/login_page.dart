import 'package:coffee/core/model/user_model.dart';
import 'package:coffee/core/service/auth_service.dart';
import 'package:coffee/pages/home_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();

    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFEEDCC6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox.square(
              dimension: 300,
            ),
            Text(
              "Wolcome \n Back",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF230C02)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                      hintText: 'UserName',
                      hintStyle: TextStyle(color: Color(0xFF230C02)),
                      border: UnderlineInputBorder()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Color(0xFF230C02)),
                      border: UnderlineInputBorder()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()async {
                  // kminchelle
                  // 0lelplR
             bool status =   await  AuthServiceImpl().login(UserModel(username: username.text, password: password.text));

             if(status){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
             }
             
                },
                child: Container(
                  width: 333,
                  height: 47,
                  child: Center(
                    child: Text('LogIn', style: TextStyle(color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF230C02),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 333,
                height: 47,
                child: Center(
                  child:
                      Text('LogIn', style: TextStyle(color: Color(0xFF230C02))),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFEEDCC6),
                  border: Border.all(color: Color(0xFF230C02)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
