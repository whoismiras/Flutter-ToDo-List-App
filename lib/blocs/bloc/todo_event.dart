part of 'todo_bloc.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends ToDoEvent {
  final ToDo todo;
  const AddTask({
    required this.todo,
  });

  @override
  List<Object> get props => [todo];
}

class DeleteToDo extends ToDoEvent {
  //final ToDo todo;
  final int index;
  const DeleteToDo({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

class HandlerToDo extends ToDoEvent {
  final ToDo todo;
  final List<ToDo> todoList;
  const HandlerToDo({
    required this.todo,
    required this.todoList,
  });
}
