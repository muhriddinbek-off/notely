import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/models/notes.dart';
import 'package:notely/presintation/cubit/home_cubit.dart';
import 'package:notely/presintation/global.dart';
import 'package:notely/presintation/ui/resources/app_styles.dart';
import '../../widgets/add_note_input.dart';
import '../../widgets/buttons.dart';

class EditScreen extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  final String category;
  final int index;
  const EditScreen({
    super.key,
    required this.category,
    required this.descriptionController,
    required this.titleController,
    required this.index,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

String dropdownValue = noteCategory[0];

class _EditScreenState extends State<EditScreen> {
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
                    'Edit note',
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
              AddNoteInput(maxlenth: 1, hint: 'Add title', title: 'Title', textEditingController: widget.titleController),
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
              AddNoteInput(maxlenth: 10, hint: 'Add description', title: 'Description', textEditingController: widget.descriptionController),
              const SizedBox(height: 20),
              ButtonWidget(
                  onchange: () {
                    context.read<HomeCubit>().noteChange(
                          Notes(
                            category: dropdownValue,
                            description: widget.descriptionController.text,
                            title: widget.titleController.text,
                          ),
                          widget.index,
                        );
                    Navigator.pop(context);
                  },
                  title: 'Edit'),
            ],
          ),
        ),
      ),
    );
  }
}
