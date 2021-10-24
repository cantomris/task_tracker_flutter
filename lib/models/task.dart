class Task {
  int? id;
  int? remind;
  int? color;
  int? isCompleted;
  String? title;
  String? note;
  String? date;
  String? startTime;
  String? endTime;
  String? repeat;

  Task(
      {this.id,
      this.remind,
      this.isCompleted,
      this.color,
      this.title,
      this.note,
      this.date,
      this.startTime,
      this.endTime,
      this.repeat});
  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    remind = json['remind'];
    color = json['color'];
    isCompleted = json['isCompleted'];
    title = json['title'];
    note = json['note'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    repeat = json['repeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['remind'] = this.remind;
    data['color'] = this.color;
    data['isCompleted'] = this.isCompleted;
    data['title'] = this.title;
    data['note'] = this.note;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['repeat'] = this.repeat;
    return data;
  }
}
