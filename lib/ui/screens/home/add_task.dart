import 'package:advance_task_manager/ui/shared/constants.dart';
import 'package:advance_task_manager/ui/shared/test_styles.dart';
import 'package:advance_task_manager/ui/shared/widgets/add_task_input_field.dart';
import 'package:advance_task_manager/ui/shared/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../bloc/tasks/tasks_cubit.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static const String id = "add tasks screen route id";
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

final TextEditingController _titleTextController = TextEditingController();
final TextEditingController _noteTextController = TextEditingController();

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now());
  String _endTime = "9:00 PM";
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat = "Never";
  List<String> repeatList = [
    'Never',
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _selectedColor = 0;

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
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Color(0xFF000000),
            size: 28.0,
          ),
        ),
      ),
      body: BlocBuilder(
        bloc: tasksCubit,
        builder: (BuildContext context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 8.0),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Task",
                  style: headerTextStyle,
                ),
                const Gap(20),
                AddTaskInputField(
                  label: "Title",
                  hintText: "Enter title here",
                  controller: _titleTextController,
                ),
                AddTaskInputField(
                  label: "Note",
                  hintText: "Enter note here",
                  controller: _noteTextController,
                ),
                AddTaskInputField(
                  label: "Date",
                  hintText: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                      onPressed: () {
                        _getDateFromUser();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.calendar,
                        color: Color(0xFF000000),
                      )),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AddTaskInputField(
                        label: "Start Time",
                        hintText: _startTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: true);
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.clock,
                              color: Color(0xFF000000),
                            )),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: AddTaskInputField(
                        label: "End Time",
                        hintText: _endTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: false);
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.clock,
                              color: Color(0xFF000000),
                            )),
                      ),
                    ),
                  ],
                ),
                AddTaskInputField(
                  label: "Remind",
                  hintText: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                      icon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      iconSize: 32,
                      underline: const SizedBox.shrink(),
                      items: remindList
                          .map<DropdownMenuItem<String>>((int value) =>
                              DropdownMenuItem<String>(
                                  value: value.toString(), child: Text(value.toString())))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      }),

                  // const Icon(Icons.keyboard_arrow_down),
                ),
                AddTaskInputField(
                  label: "Repeat",
                  hintText: _selectedRepeat,
                  widget: DropdownButton(
                      icon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_down),
                      ),
                      iconSize: 32,
                      underline: const SizedBox.shrink(),
                      items: repeatList
                          .map<DropdownMenuItem<String>>((String value) =>
                              DropdownMenuItem<String>(
                                  value: value.toString(), child: Text(value.toString())))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Color",
                          style: textFieldHeaderStyle,
                        ),
                        const Gap(18),
                        Wrap(
                          children: List<Widget>.generate(
                              3,
                              (int index) => Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedColor = index;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: index == 0
                                            ? lightThemePrimaryColor
                                            : index == 1
                                                ? pinkColor
                                                : yellowColor,
                                        child: _selectedColor == index
                                            ? const Icon(
                                                Icons.check,
                                                size: 16.0,
                                                color: primaryColor2,
                                              )
                                            : const SizedBox.shrink(),
                                      ),
                                    ),
                                  )),
                        )
                      ],
                    ),
                    CustomButton(
                      label: "Create Task",
                      color: lightThemePrimaryColor,
                      width: 120,
                      height: 50,
                      onPressed: () async {
                        Navigator.pop(context);

                        await tasksCubit.addTask(
                            title: _titleTextController.text,
                            note: _noteTextController.text,
                            date: _selectedDate,
                            startTime: _startTime,
                            endTime: _endTime,
                            remind: _selectedRemind,
                            repeat: _selectedRepeat,
                            color: primaryColor1);
                        print(tasksCubit.tasksListInMemory[0].title);
                        _titleTextController.clear();
                        _noteTextController.clear();
                      },
                      radius: 15.0,
                      textColor: primaryColor2,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2121),
    );
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    } else {
      const SnackBar(content: Text("Something went wrong"));
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await _showTimePicker();
    // ignore: use_build_context_synchronously
    String formattedTime = pickedTime!.format(context);
    if (isStartTime == true) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formattedTime;
      });
    } else {
      const SnackBar(content: Text("Something went wrong"));
    }
  }

  _showTimePicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(
          // hour: int.parse(_startTime.split(":")[0]),
          // minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
          ),
      initialEntryMode: TimePickerEntryMode.dial,
    );
  }

  _validateData() {
    if (_titleTextController.text.isNotEmpty && _noteTextController.text.isNotEmpty) {}
  }
}

/*

 */
