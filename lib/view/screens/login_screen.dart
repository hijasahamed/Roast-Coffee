import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/login_screen_controller.dart';
import 'package:roast_coffee/view/widgets/login_widgets/login_button_widget.dart';
import 'package:roast_coffee/view/widgets/login_widgets/login_head_widget.dart';
import 'package:roast_coffee/view/widgets/login_widgets/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF356B69),
      body:  Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: SingleChildScrollView(
              child: Column(
                spacing: screenSize.width/25,
                children: [
                  SizedBox(height: screenSize.height/20,),
                  Container(
                    padding: EdgeInsets.all(screenSize.width/15),
                    child: Form(
                      key: loginProvider.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: screenSize.width/25,
                        children: [
                          LoginHeadWidget(screenSize: screenSize),
                          CustomTextField(label: 'Username',controller: loginProvider.usernameController,),
                          CustomTextField(label: 'Password',isPasswordField: true,controller: loginProvider.passwordController,),            
                          LoginButtonWidget(screenSize: screenSize),
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/images/flower.png',fit: BoxFit.cover,filterQuality: FilterQuality.high,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}