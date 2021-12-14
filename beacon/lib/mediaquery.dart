import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double deviceHeight(BuildContext context) {
  return displaySize(context).height;
}

double deviceWidth(BuildContext context) {
  return displaySize(context).width;
}
