import 'package:flutter/material.dart';

import '../resources/app_color.dart';
import '../resources/app_styles.dart';
import '../screens/edit/edit.dart';

class NotesTask extends StatelessWidget {
  String category;
  String title;
  String description;
  Function() delete;
  Function() edit;
  NotesTask({
    super.key,
    required this.category,
    required this.description,
    required this.title,
    required this.delete,
    required this.edit,
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
                Chip(label: Text(category)),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (v) {}),
                    IconButton(onPressed: edit, icon: Icon(Icons.edit, color: AppColors.iconsColor)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Delete note', style: AppStyle.getNotes().copyWith(fontWeight: FontWeight.w800)),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close)),
                                    ],
                                  ),
                                  content: const Text('Are you want to delete this note?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel', style: AppStyle.getAddTitle())),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: const MaterialStatePropertyAll(Colors.green),
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                                        ),
                                        onPressed: delete,
                                        child: Text('Delete', style: AppStyle.getAddTitle())),
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.delete_forever_outlined, color: AppColors.iconsColor)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            Text(title, style: AppStyle.getTask()),
            const SizedBox(height: 12),
            Text(description, style: AppStyle.getTaskSubtitle()),
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
