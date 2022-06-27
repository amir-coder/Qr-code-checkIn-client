import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  final String tag;
  final Function callback;
  final bool isactive;
  const CheckButton({
    Key? key,
    this.isactive = false,
    required this.callback,
    required this.tag,
  }) : super(key: key);

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => {
          if (!widget.isactive) {widget.callback()}
        },
        child: Container(
          width: 132.0,
          height: 48.0,
          decoration: BoxDecoration(
            color: widget.isactive ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              widget.tag,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
