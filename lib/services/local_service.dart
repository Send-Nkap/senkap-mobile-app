import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalService<T> {
  Future<Either<String, Box>> openBox();
  Future<Either<String, void>> addData(T data);
  Future<Either<String, void>> editData(T oldData, T newData);
  Future<Either<String, List<T>>> getData();
  Future<Either<String, bool>> removeData(T data);
}
