import 'package:bloc/bloc.dart';
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
    print('delete');
    final list = state.todoList;
    try {
      list.removeAt(event.index);
    } catch (e) {}
    emit(ToDoState(
      todoList: list,
    ));
  }

  void _onHandlerToDo(HandlerToDo event, Emitter<ToDoState> emit) {
    print('handler');
    final todo = event.todo.copyWith(isDone: !event.todo.isDone);

    if (todo.isDone) {
      event.todoList.remove(event.todo);
      event.todoList.add(todo);
      emit(ToDoState(
        todoList: event.todoList,
      ));
    }
  }
}
