import 'package:advance_task_manager/bloc/tasks/tasks_cubit.dart';
import 'package:advance_task_manager/services/theme_services.dart';
import 'package:advance_task_manager/ui/screens/home/add_task.dart';
import 'package:advance_task_manager/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/theme.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<TasksCubit>(create: (BuildContext context) => TasksCubit())
    ], child: const AdvanceTaskManager()),
  );
}

class AdvanceTaskManager extends StatelessWidget {
  const AdvanceTaskManager({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advance Task Manager',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      // themeMode: ThemeMode.dark,
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        AddTaskScreen.id: (context) => const AddTaskScreen(),
      },
    );
  }
}
