class ToDo {
  String tittle;
  String description;
  ToDo(this.tittle, this.description);
}

void main() {
  List<ToDo> todos = [
    ToDo('Code', 'at 7:00 a.m.'),
    ToDo('Walk', '5:00 p.m.'),
    ToDo('Breakfast', '5:00 a.m.'),
    ToDo('Study', '7:00 p.m.'),
  ];

  todos[3] = ToDo("Read", "7:00 p.m.");
}
