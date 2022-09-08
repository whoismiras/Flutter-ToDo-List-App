import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final void Function() onToDoChanged;
  final void Function() onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: onToDoChanged,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: tdTdColor,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdwhite,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdwhite,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdwhite,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.grey,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: onDeleteItem,
          ),
        ),
      ),
    );
  }
}
