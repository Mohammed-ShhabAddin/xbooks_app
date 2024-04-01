import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xbooks_store/core/helper/extension.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: ' Don\'t have an account? ',
                style: TextStyles.font13DarkBlueRegular,
              ),
              TextSpan(
                  text: ' Register Now!',
                  style: TextStyles.font13BlueSemiBold,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.pushReplacementNamed(Routes.signupScreen);
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
