import 'package:flutter/material.dart';
import '../../config/typography/typo.dart';

class NautzInsetContainer extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? insetColor;
  final Widget? additionalChild;
  final String? tag;
  final Function onTap;
  // final String description;
  const NautzInsetContainer({
    required this.title,
    required this.onTap,
    this.color,
    this.insetColor,
    super.key,
    this.additionalChild,
    this.tag,
  });

  Color getColor(String questionString) {
    if (questionString.split('').length == 4) {
      return Colors.redAccent;
    } else if (questionString.split('').length == 1) {
      return Colors.yellowAccent;
    } else if (questionString.split('').length == 2) {
      return Colors.pinkAccent;
    } else if (questionString.split('').length == 3) {
      return Colors.greenAccent;
    } else if (questionString.split('').length == 4) {
      return Colors.blueAccent;
    } else if (questionString.split('').length == 5) {
      return Colors.deepOrange;
    } else if (questionString.split('').length == 6) {
      return Colors.cyanAccent;
    } else if (questionString.split('').length == 7) {
      return Colors.purpleAccent;
    } else if (questionString.split('').length == 7) {
      return Colors.red;
    } else if (questionString.split('').length == 8) {
      return Colors.orange;
    } else if (questionString.split('').length == 9) {
      return Colors.yellow;
    } else if (questionString.split('').length == 10) {
      return Colors.deepPurple;
    } else {
      return Colors.deepPurple;
      // return Color(0xffeb7100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              color: color == null ? getColor(title) : color!, width: 2),
          boxShadow: [
            BoxShadow(
                offset: Offset(-10, 10),
                spreadRadius: 2,
                blurRadius: 2,
                color: insetColor == null ? getColor(title) : insetColor!)
            // color: Color(0xffeb7100))
          ],
        ),
        child: Row(
          children: [
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    if (tag != null)
                      Text(
                        '${tag} ',
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.caption(context),
                      ),
                  ]),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.subtitle(context)
                          .copyWith(color: Colors.black)
                          .copyWith(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   course.imageUrl,
                        //   style: AppTypography.caption(context)
                        //       .copyWith(color: Colors.black),
                        // ),
                        if (additionalChild != null) additionalChild!
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class NautzInsetContainer2 extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? insetColor;
  final Widget? additionalChild;
  final String? tag;
  final Function onTap;
  // final String description;
  const NautzInsetContainer2({
    required this.title,
    required this.onTap,
    this.color,
    this.insetColor,
    super.key,
    this.additionalChild,
    this.tag,
  });

  Color getColor(String questionString) {
    if (questionString.split('').length == 4) {
      return Colors.redAccent;
    } else if (questionString.split('').length == 1) {
      return Colors.yellowAccent;
    } else if (questionString.split('').length == 2) {
      return Colors.pinkAccent;
    } else if (questionString.split('').length == 3) {
      return Colors.greenAccent;
    } else if (questionString.split('').length == 4) {
      return Colors.blueAccent;
    } else if (questionString.split('').length == 5) {
      return Colors.deepOrange;
    } else if (questionString.split('').length == 6) {
      return Colors.cyanAccent;
    } else if (questionString.split('').length == 7) {
      return Colors.purpleAccent;
    } else if (questionString.split('').length == 7) {
      return Colors.red;
    } else if (questionString.split('').length == 8) {
      return Colors.orange;
    } else if (questionString.split('').length == 9) {
      return Colors.yellow;
    } else if (questionString.split('').length == 10) {
      return Colors.deepPurple;
    } else {
      return Colors.deepPurple;
      // return Color(0xffeb7100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              color: color == null ? getColor(title) : color!, width: 2),
          boxShadow: [
            BoxShadow(
                offset: Offset(-10, 10),
                spreadRadius: 2,
                blurRadius: 2,
                color: insetColor == null ? getColor(title) : insetColor!)
            // color: Color(0xffeb7100))
          ],
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    if (tag != null)
                      Text(
                        '${tag} ',
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.caption(context)
                            .copyWith(color: Colors.blue),
                      ),
                  ]),
            ),
            // SizedBox(
            //   width: 5,
            // ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.subtitle(context)
                          .copyWith(color: Colors.black)
                          .copyWith(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   course.imageUrl,
                        //   style: AppTypography.caption(context)
                        //       .copyWith(color: Colors.black),
                        // ),
                        if (additionalChild != null) additionalChild!
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
