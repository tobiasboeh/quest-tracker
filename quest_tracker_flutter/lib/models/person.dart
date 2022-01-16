import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? classType;

  @HiveField(2)
  String? desc;
}
