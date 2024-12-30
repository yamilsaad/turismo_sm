import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class CustomMobileItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final int delay;

  const CustomMobileItem(
      {Key? key, required this.text, required this.onPressed, this.delay = 0})
      : super(key: key);

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMobileItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      duration: Duration(milliseconds: 150),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isHover ? Color(0XFF00ADB5) : Colors.transparent,
            ),
            duration: Duration(milliseconds: 300),
            width: 100,
            height: 35,
            child: Center(
              child: Text(widget.text,
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
