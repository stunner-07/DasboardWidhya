class Task {
  String taskNo;
  String timeTaken;
  Task(this.timeTaken, this.taskNo);
}

class Mission {
  String name;
  String companyName;
  int progress;
  List<Task> task;
  Mission(this.name, this.companyName, this.progress, this.task);
}
