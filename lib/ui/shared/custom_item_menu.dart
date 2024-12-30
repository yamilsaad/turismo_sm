import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final int delay;

  const CustomMenuItem(
      {Key? key, required this.text, required this.onPressed, this.delay = 0})
      : super(key: key);

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
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
              color: isHover ? Color(0XFFBBC3A4) : Colors.transparent,
            ),
            duration: Duration(milliseconds: 300),
            width: 150,
            height: 50,
            child: Center(
              child: Text(widget.text,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
