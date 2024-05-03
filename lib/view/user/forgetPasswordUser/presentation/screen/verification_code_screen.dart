import 'package:flutter/material.dart';

import '../widget/verification_code_body.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerificationCodeBody(),
    );
  }
}
