import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String? text = "";
  double? fontSize = 14;
  Color? textColor;
  FontWeight? fontWeight = FontWeight.normal;
  TextOverflow? textOverflow = TextOverflow.ellipsis;
  TextAlign? textAlign = TextAlign.end;
  TextDirection? textDirection;
  CustomText(
      {Key? key,
      this.text = "",
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.textOverflow,
      this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      textDirection: textDirection ?? TextDirection.ltr,
      maxLines: 5,
    );
  }
}
