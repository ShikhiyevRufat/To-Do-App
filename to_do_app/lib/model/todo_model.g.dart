part of 'todo_model.dart';

class TaskAdapter extends TypeAdapter<ToDo> {
  @override
  final int typeId = 0;

  @override
  ToDo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDo(
      titleTask: fields[0] as String,
      description: fields[1] as String,
      timeTask: fields[2] as String,
      dateTask: fields[3] as String,
      isDone: fields[4] as bool,
      category: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ToDo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.titleTask)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.timeTask)
      ..writeByte(3)
      ..write(obj.dateTask)
      ..writeByte(4)
      ..write(obj.isDone)
      ..writeByte(5)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
