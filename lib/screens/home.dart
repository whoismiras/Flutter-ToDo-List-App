import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';
import 'package:todolist/widgets/todo_item.dart';
import 'package:todolist/models/todo.dart';

import '../blocs/bloc/bloc_exports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        List<ToDo> tasksList = state.todoList;
        return Scaffold(
          backgroundColor: tdBGColor,
          body: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 60, right: 20, left: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: tdwhite,
                          ),
                          hintText: 'Type text ....',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      var task = ToDo(
                        todoText: _todoController.text,
                        id: _todoController.text,
                      );
                      context.read<ToDoBloc>().add(AddTask(todo: task));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        color: tdwhite,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  itemCount: tasksList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todoo = tasksList.elementAt(index);
                    return ToDoItem(
                      todo: tasksList.elementAt(index),
                      onToDoChanged: () {
                        context
                            .read<ToDoBloc>()
                            .add(HandlerToDo(todo: todoo, todoList: tasksList));
                      },
                      onDeleteItem: () {
                        context
                            .read<ToDoBloc>()
                            .add(DeleteToDo(index: tasksList.indexOf(todoo)));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
