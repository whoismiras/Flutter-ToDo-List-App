part of 'todo_bloc.dart';

class ToDoState extends Equatable {
  final List<ToDo> todoList;
  const ToDoState({
    this.todoList = ToDo.todoList,
  });

  @override
  List<Object> get props => [todoList];
}
