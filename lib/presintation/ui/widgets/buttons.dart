import 'package:flutter/material.dart';
import '../resources/app_styles.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  Function()? onchange;
  ButtonWidget({
    super.key,
    required this.title,
    required this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: onchange, child: Text('Cancel', style: AppStyle.getAddTitle())),
        const SizedBox(width: 20),
        ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
            ),
            onPressed: onchange,
            child: Text(title)),
      ],
    );
  }
}
