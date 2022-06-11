import 'package:advance_task_manager/bloc/tasks/tasks_cubit.dart';
import 'package:advance_task_manager/ui/screens/home/add_task.dart';
import 'package:advance_task_manager/ui/shared/constants.dart';
import 'package:advance_task_manager/ui/shared/test_styles.dart';
import 'package:advance_task_manager/ui/shared/widgets/custom_button.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home page route id";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TasksCubit tasksCubit;
  @override
  void initState() {
    tasksCubit = BlocProvider.of<TasksCubit>(context);
    tasksCubit.fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        // leading: GestureDetector(
        //   onTap: () {},
        //   child: const Icon(Icons.nightlight_round),
        // ),
        actions: const [
          CircleAvatar(
            radius: 20,
          ),
          Gap(20),
        ],
      ),
      body: BlocBuilder(
        bloc: tasksCubit,
        builder: (BuildContext context, state) {
          if (state is AddStateLoading) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: subHeaderTextStyle,
                          ),
                          Text(
                            "Today",
                            style: headerTextStyle,
                          ),
                        ]),
                        CustomButton(
                          label: "Add Task",
                          color: lightThemePrimaryColor,
                          width: 150,
                          height: 50,
                          onPressed: () {
                            Navigator.pushNamed(context, AddTaskScreen.id);
                          },
                          radius: 10,
                          textColor: primaryColor2,
                          customLabel: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: primaryColor2,
                              ),
                              const Gap(10.0),
                              Text(
                                "Add Task",
                                style: buttonTextStyle.copyWith(color: primaryColor2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10.0),
                    DatePicker(
                      DateTime.now(),
                      height: 85.0,
                      width: 65.0,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: lightThemePrimaryColor,
                    ),
                    const Center(
                      child: IntrinsicHeight(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is DataLoading) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: subHeaderTextStyle,
                          ),
                          Text(
                            "Today",
                            style: headerTextStyle,
                          ),
                        ]),
                        CustomButton(
                          label: "Add Task",
                          color: lightThemePrimaryColor,
                          width: 150,
                          height: 50,
                          onPressed: () {
                            Navigator.pushNamed(context, AddTaskScreen.id);
                          },
                          radius: 10,
                          textColor: primaryColor2,
                          customLabel: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: primaryColor2,
                              ),
                              const Gap(10.0),
                              Text(
                                "Add Task",
                                style: buttonTextStyle.copyWith(color: primaryColor2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10.0),
                    DatePicker(
                      DateTime.now(),
                      height: 85.0,
                      width: 65.0,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: lightThemePrimaryColor,
                    ),
                    const Center(
                      child: IntrinsicHeight(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is DeleteDataLoading) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: subHeaderTextStyle,
                          ),
                          Text(
                            "Today",
                            style: headerTextStyle,
                          ),
                        ]),
                        CustomButton(
                          label: "Add Task",
                          color: lightThemePrimaryColor,
                          width: 150,
                          height: 50,
                          onPressed: () {
                            Navigator.pushNamed(context, AddTaskScreen.id);
                          },
                          radius: 10,
                          textColor: primaryColor2,
                          customLabel: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: primaryColor2,
                              ),
                              const Gap(10.0),
                              Text(
                                "Add Task",
                                style: buttonTextStyle.copyWith(color: primaryColor2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10.0),
                    DatePicker(
                      DateTime.now(),
                      height: 85.0,
                      width: 65.0,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: lightThemePrimaryColor,
                    ),
                    const Center(
                      child: IntrinsicHeight(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is AddStateSuccessful) {
            SnackBar(
              elevation: 3,
              backgroundColor: primaryColor1,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: primaryColor2,
                    ),
                  ),
                  Gap(30),
                  Text("Task added successfully"),
                ],
              ),
            );
          }
          if (state is FetchDataSuccessful) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: subHeaderTextStyle,
                          ),
                          Text(
                            "Today",
                            style: headerTextStyle,
                          ),
                        ]),
                        CustomButton(
                          label: "Add Task",
                          color: lightThemePrimaryColor,
                          width: 150,
                          height: 50,
                          onPressed: () {
                            Navigator.pushNamed(context, AddTaskScreen.id);
                          },
                          radius: 10,
                          textColor: primaryColor2,
                          customLabel: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.plus,
                                size: 16,
                                color: primaryColor2,
                              ),
                              const Gap(10.0),
                              Text(
                                "Add Task",
                                style: buttonTextStyle.copyWith(color: primaryColor2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(10.0),
                    DatePicker(
                      DateTime.now(),
                      height: 85.0,
                      width: 65.0,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: lightThemePrimaryColor,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: IntrinsicHeight(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
