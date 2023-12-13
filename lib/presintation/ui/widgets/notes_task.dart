import 'package:flutter/material.dart';

import '../resources/app_color.dart';
import '../resources/app_styles.dart';

class NotesTask extends StatelessWidget {
  const NotesTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Chip(label: Text('Business')),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (v) {}),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: AppColors.iconsColor)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever_outlined, color: AppColors.iconsColor)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            Text('Finish the task on the board', style: AppStyle.getTask()),
            const SizedBox(height: 12),
            Text('Remember to finish task on the board. After finishing give evelation Matt', style: AppStyle.getTaskSubtitle()),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('13.12.2023', style: AppStyle.getTaskSubtitle().copyWith(fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
