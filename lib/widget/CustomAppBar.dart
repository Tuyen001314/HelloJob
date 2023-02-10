import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  final VoidCallback? onBackPress;

  CustomAppBar({Key? key, required this.title, this.onBackPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget btBackWidget;
    if (onBackPress != null) {
      btBackWidget = InkWell(
          onTap: onBackPress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/icons/ic_back.svg"),
          ));
    } else {
      btBackWidget = Container();
    }
    return ConstraintLayout(
      children: [
        btBackWidget.applyConstraint(topLeftTo: parent),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black)),
        ).applyConstraint(centerTo: parent)
      ],
    );
  }

  @override
  Size get preferredSize =>  const Size(double.infinity, 48);
}
