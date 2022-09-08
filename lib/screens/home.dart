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
  // final todoList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoBloc, ToDoState>(
      builder: (context, state) {
        print('state $state');
        List<ToDo> tasksList = state.todoList;
        return Scaffold(
          backgroundColor: tdBGColor,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50, bottom: 20),
                          ),
                          for (ToDo todoo in tasksList)
                            ToDoItem(
                              todo: todoo,
                              onToDoChanged: () {
                                print('a');
                                context.read<ToDoBloc>().add(HandlerToDo(
                                    todo: todoo, todoList: tasksList));
                              },
                              onDeleteItem: () {
                                context.read<ToDoBloc>().add(DeleteToDo(
                                    index: tasksList.indexOf(todoo)));
                              },
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 60, right: 20, left: 20),
                      padding: EdgeInsets.symmetric(
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
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: tdwhite,
                            ),
                            hintText: 'Type text ....',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 60,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: tdwhite,
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {
                        var task = ToDo(
                          todoText: _todoController.text,
                          id: _todoController.text,
                        );
                        context.read<ToDoBloc>().add(AddTask(todo: task));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
