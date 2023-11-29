import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel extends Equatable {
  ContactModel({required this.name, required this.phone});

  @HiveField(0)
  String name;

  @HiveField(1)
  int phone;

@override
  List<Object> get props => [name, phone];
}
