import 'package:flutter/material.dart';
import 'package:xiphone/config/typography/typo.dart';


class SButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? insetColor; 
  final String? tag;
  final Function onTap; 
  const SButton({
    required this.title,
    required this.onTap,
    this.color,
    this.insetColor,
    super.key, 
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
    }
    else {
      return Colors.deepPurple;
      // return Color(0xffeb7100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        // margin: EdgeInsets.only(bottom: 20),
        // height: 10,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:  Colors.white,
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
            Text(
              title,
              style: AppTypography.subtitle(context)
                  .copyWith(color: Colors.black)
                  .copyWith(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
              ],
            ),
          ],
        ),
      ),
    );
  }
}
