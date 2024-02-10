import 'package:flutter/material.dart';
import 'package:riverpod_practice/views/components/rich_text/base_text.dart';
import 'package:riverpod_practice/views/components/rich_text/rich_text_widget.dart';
import 'package:riverpod_practice/views/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewSignupLink extends StatelessWidget {
  const LoginViewSignupLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll:
          Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
      texts: [
        BaseText.plain(text: Strings.dontHaveAnAccount),
        BaseText.plain(text: Strings.signUp),
        BaseText.link(
          text: Strings.facebook,
          onTap: () => launchUrl(Uri.parse(Strings.facebookSignUpUrl)),
        ),
        BaseText.plain(text: Strings.orCreateAnAccountOn),
        BaseText.link(
          text: Strings.google,
          onTap: () => launchUrl(Uri.parse(Strings.googleSignUpUrl)),
        ),
      ],
    );
  }
}
