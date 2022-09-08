class ToDo {
  final String? id;
  final String? todoText;
  final bool isDone;

  const ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static const List<ToDo> todoList = [
    ToDo(id: '01', todoText: 'Morning Excercise', isDone: true),
    ToDo(id: '02', todoText: 'Check Emails', isDone: true),
    ToDo(
      id: '03',
      todoText: 'Buy Groceries',
    ),
    ToDo(
      id: '04',
      todoText: 'Team Meating',
    ),
    ToDo(
      id: '05',
      todoText: 'Dinner with Yerkbn',
    ),
  ];

  ToDo copyWith({String? id, String? todoText, bool? isDone}) {
    return ToDo(
      id: id ?? this.id,
      todoText: todoText ?? this.todoText,
      isDone: isDone ?? this.isDone,
    );
  }
}
