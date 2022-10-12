import 'package:flutter/material.dart';
import 'package:to_do/components/category_dialog.dart';
import 'package:to_do/models/task.dart';
import 'package:intl/intl.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  Task? task;
  final TextEditingController _taskNameController = TextEditingController();
  final DateFormat formatDate = DateFormat("dd/MM/yyyy");
  final DateTime now = DateTime.now();
  late DateTime date = DateTime(now.year, now.month, now.day);

  // Avaliar se há necessidade de remover o padding geral
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${task == null ? 'New' : 'Edit'} Task"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.add_task_rounded,
                  size: 32,
                  color: Colors.black,
                ),
                labelText: "Task Title",
                labelStyle: TextStyle(fontSize: 24, color: Colors.black),
                border: OutlineInputBorder(),
              ),
              controller: _taskNameController,
              maxLength: 48,
            ),
            divider(),

            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  // barrierDismissible: false, // User must tap button
                  builder: (context) {
                    return const CategoryDialog();
                  }
                );
              },
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(
                      Icons.category,
                      size: 38,
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Category",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Icon(Icons.category),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            divider(),
            InkWell(
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(now.year, now.month, now.day),
                  lastDate: DateTime(date.year + 100),
                );
                if (newDate == null) {return;}
                setState(() {date = newDate;});
              },
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(
                      Icons.calendar_month_rounded,
                      size: 38,
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          "Date",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          formatDate.format(date),
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            divider(),
          ],
        ),
      ),
    );
  }

  Widget divider() => Divider(
    color: Colors.blueGrey[300],
    thickness: 1,
  );
}