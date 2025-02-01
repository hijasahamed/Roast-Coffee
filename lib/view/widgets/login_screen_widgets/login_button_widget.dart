import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/login_screen_controller.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return InkWell(
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
              : TextWidget(text: 'LOGIN', color: Colors.white, size: screenSize.width/25, weight: FontWeight.bold)
            ),
          ),
        );
      },
    );
  }
}