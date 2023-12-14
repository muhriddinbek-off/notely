import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/presintation/cubit/home_cubit.dart';
import 'package:notely/presintation/global.dart';
import 'package:notely/presintation/ui/screens/add_screen/add_screen.dart';
import '../../resources/app_styles.dart';
import '../../widgets/notes_task.dart';
import '../edit/edit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeCubit>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: size.width * 0.65,
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.blue.shade50,
                    filled: true,
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.07),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue.shade400),
                minimumSize: const MaterialStatePropertyAll(Size(0, 45)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddScreen()));
              },
              child: const Text('+  Add'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Your Notes', style: AppStyle.getNotes()),
            const SizedBox(height: 10),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    width: size.width * 0.76,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.read<HomeCubit>().change(index);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(categories[index], style: read.index == index ? AppStyle.getCategory().copyWith(color: Colors.blue) : AppStyle.getCategory()),
                                Container(
                                  height: 2,
                                  width: 100,
                                  color: read.index == index ? Colors.blue : Colors.blue.shade100,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(height: 400);
                            });
                      },
                      icon: const Icon(Icons.keyboard_double_arrow_down),
                      iconSize: 30),
                ],
              );
            }),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
                if (state is NoteLoading) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.note.length,
                      itemBuilder: (context, index) {
                        return NotesTask(
                          category: state.note[index].category,
                          title: state.note[index].title,
                          description: state.note[index].description,
                          delete: () {
                            read.removeTask(state.note[index]);
                            Navigator.pop(context);
                          },
                          edit: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const EditScreen()));
                          },
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      'List Empty',
                      style: AppStyle.getNotes(),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
