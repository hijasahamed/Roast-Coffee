import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/login_screen_controller.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/common_widgets/textform_widget.dart';

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
                          Container(
                            padding: EdgeInsets.only(bottom: screenSize.width/35),
                            child: Column(
                              spacing: screenSize.width/50,
                              children: [
                                SizedBox(
                                  height: screenSize.width/5,
                                  width: screenSize.width/4.97,
                                  child: Image.asset('assets/images/login logo.png',fit: BoxFit.cover,)
                                ),
                                TextWidget(text: 'Login to your account', color: Colors.white, size: screenSize.width/19.5, fontFamily: 'Inter', weight: FontWeight.w800),
                                TextWidget(text: 'Enter your details to login', color: Colors.white, size: screenSize.width/30, fontFamily: 'Inter', weight: FontWeight.w500),
                              ],
                            ),
                          ),
                          CustomTextField(label: 'Username',controller: loginProvider.usernameController,),
                          CustomTextField(label: 'Password',isPasswordField: true,controller: loginProvider.passwordController,),            
                          InkWell(
                            onTap: () {
                              loginProvider.login(context);
                            },
                            child: Ink(
                              width: screenSize.width,
                              padding: EdgeInsets.all(screenSize.width/30),
                              decoration: BoxDecoration(
                                color: Color(0XFFCEAC6D),
                                borderRadius: BorderRadius.circular(screenSize.width/35)
                              ),
                              child: Center(
                                child: loginProvider.isLoading==true? CircularProgressIndicator(color: Colors.white,strokeWidth: 2,)
                                : TextWidget(text: 'LOGIN', color: Colors.white, size: screenSize.width/25, fontFamily: 'Inter', weight: FontWeight.bold)
                              ),
                            ),
                          ),
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