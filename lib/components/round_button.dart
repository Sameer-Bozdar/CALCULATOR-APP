import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback onPress;

  const RoundButton(
      {Key? key, required this.name, this.color = const Color(0xffafafaf),
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: InkWell(
          onTap: onPress,
          splashColor: Colors.black,
          child: Container(
            height: 70,
            width: 60,
            child: Center(
                child: Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

