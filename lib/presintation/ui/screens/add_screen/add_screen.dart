import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/models/notes.dart';
import 'package:notely/presintation/cubit/home_cubit.dart';
import 'package:notely/presintation/global.dart';
import 'package:notely/presintation/ui/resources/app_styles.dart';
import '../../widgets/add_note_input.dart';
import '../../widgets/buttons.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String dropdownValue = noteCategory[0];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Note',
                    style: AppStyle.getTask(),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 40),
              AddNoteInput(maxlenth: 1, hint: 'Add title', title: 'Title', textEditingController: titleController),
              const SizedBox(height: 30),
              Text('Category', style: AppStyle.getAddTitle()),
              const SizedBox(height: 10),
              Card(
                margin: EdgeInsets.zero,
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                      value: dropdownValue,
                      dropdownColor: Colors.blue.shade100,
                      isExpanded: true,
                      items: List.generate(noteCategory.length, (index) {
                        return DropdownMenuItem<String>(
                          child: Text(noteCategory[index]),
                          value: noteCategory[index],
                        );
                      }),
                      onChanged: (v) {
                        setState(() {
                          dropdownValue = v!;
                        });
                      }),
                ),
              ),
              const SizedBox(height: 30),
              AddNoteInput(maxlenth: 10, hint: 'Add description', title: 'Description', textEditingController: descriptionController),
              const SizedBox(height: 20),
              ButtonWidget(
                  onchange: () {
                    if (titleController.text != '' && descriptionController.text != '') {
                      context.read<HomeCubit>().addTask(Notes(category: dropdownValue, description: descriptionController.text, title: titleController.text));
                      Navigator.pop(context);
                    }
                  },
                  title: 'Add'),
            ],
          ),
        ),
      ),
    );
  }
}
