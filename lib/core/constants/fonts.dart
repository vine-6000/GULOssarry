import 'package:flutter/material.dart';

class Fontcolors {
  static const Color softblack = Color.fromRGBO(18, 18, 18, 1);
  static const Color softWhite = Color.fromRGBO(248, 249, 250, 1);
}

class PlainText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final double spacing;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int? maxLine;

  const PlainText({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = Fontcolors.softblack,
    this.spacing = 0,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,

        letterSpacing: spacing,
      ),
    );
  }
}

class Roboto extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final double spacing;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int? maxLine;

  const Roboto({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = Fontcolors.softblack,
    this.spacing = 0,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: "Roboto",
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: spacing,
      ),
    );
  }
}

class Tagesschrift extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final double spacing;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int? maxLine;

  const Tagesschrift({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = Fontcolors.softblack,
    this.spacing = 0,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: "Tagesschrift",
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: spacing,
      ),
    );
  }
}

class ChlakFont1 extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final double spacing;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int? maxLine;

  const ChlakFont1({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.w300,
    this.fontcolor = Fontcolors.softblack,
    this.spacing = 0,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: "FrederickaTheGreat",
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: spacing,
      ),
    );
  }
}

class ChlakFont2 extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final double spacing;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int? maxLine;

  const ChlakFont2({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.w300,
    this.fontcolor = Fontcolors.softblack,
    this.spacing = 0,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: "CabinSketch",
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: spacing,
      ),
    );
  }
}

class PtSerif extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final double spacing;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final int? maxLine;

  const PtSerif({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.w300,
    this.fontcolor = Fontcolors.softblack,
    this.spacing = 0,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.maxLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: "Pt_serif",
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: spacing,
      ),
    );
  }
}
