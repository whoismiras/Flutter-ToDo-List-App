import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(const ToDoState()) {
    on<AddTask>(_onAddTask);
    on<DeleteToDo>(_onDeleteToDo);
    on<HandlerToDo>(_onHandlerToDo);
  }

  void _onAddTask(AddTask event, Emitter<ToDoState> emit) {
    emit(ToDoState(
      todoList: List.from(state.todoList)..add(event.todo),
    ));
  }

  void _onDeleteToDo(DeleteToDo event, Emitter<ToDoState> emit) {
    emit(ToDoState(
      todoList: List.from(state.todoList)..removeAt(event.index),
    ));
  }

  void _onHandlerToDo(HandlerToDo event, Emitter<ToDoState> emit) {
    final todo = event.todo.copyWith(isDone: !event.todo.isDone);

    if (todo.isDone) {
      emit(ToDoState(
        todoList: List.from(state.todoList)
          ..remove(event.todo)
          ..add(todo),
      ));
    } else {
      emit(ToDoState(
        todoList: List.from(state.todoList)
          ..remove(event.todo)
          ..insert(0, todo),
      ));
    }
  }
}
