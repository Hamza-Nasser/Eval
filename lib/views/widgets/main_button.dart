
import 'package:flutter/material.dart';


class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            elevation: 0
          ),
        onPressed: onTap,
        child: Text(
          text
        ),
      ),
    );
  }
}