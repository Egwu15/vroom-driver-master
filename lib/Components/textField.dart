import 'package:flutter/material.dart';
import 'package:vroom_driver/Theme/colors.dart';

class TextInput extends StatefulWidget {
  final String hintText;
  final Radius borderRadiusTopLeft;
  final Radius borderRadiusTopRight;
  final Radius borderRadiusBottomLeft;
  final Radius borderRadiusBottomRight;
  final String label;
  final EdgeInsets padding;
  final Color color;
  final Color hintTextColor;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final double width;
  final double height;
  final int maxLines;
  final TextStyle hintStyle;
  TextInput(
      {this.hintText,
      this.borderRadiusTopLeft = Radius.zero,
      this.borderRadiusTopRight = Radius.zero,
      this.borderRadiusBottomLeft = Radius.zero,
      this.borderRadiusBottomRight = Radius.zero,
      this.label,
      this.padding,
      this.color,
      this.prefixIcon,
      this.suffixIcon,
      this.width,
      this.height,
      this.maxLines,
      this.hintTextColor,
      this.hintStyle});
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: widget.height ?? 55,
      width: widget.width ?? 220,
      child: TextFormField(
        maxLines: widget.maxLines,
        style: theme.textTheme.bodyText2,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              theme.textTheme.bodyText1
                  .copyWith(color: widget.hintTextColor ?? hintTextColor),
          filled: true,
          fillColor: Color(0xfff5f4f4),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
                topLeft: widget.borderRadiusTopLeft,
                topRight: widget.borderRadiusTopRight,
                bottomLeft: widget.borderRadiusBottomLeft,
                bottomRight: widget.borderRadiusBottomRight),
          ),
        ),
      ),
    );
  }
}
