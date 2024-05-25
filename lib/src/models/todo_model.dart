class Todo {
  final String name;
  final String description;
  final int timeStamp;

  Todo(this.name, this.description, this.timeStamp);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'timeStamp': timeStamp,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      json['name'],
      json['description'],
      json['timeStamp'],
    );
  }
}
