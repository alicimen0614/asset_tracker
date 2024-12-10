import 'package:flutter/material.dart';

class CustomSizedBox {
  static SizedBox height({double ratio = 0.01, required BuildContext context}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * ratio,
    );
  }

  static SizedBox width(double ratio, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * ratio,
    );
  }
}
