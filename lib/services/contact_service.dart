import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/contact_model.dart';
import 'local_service.dart';

class ContactService extends LocalService<ContactModel> {
  // static ContactService? _contactService;
  // ContactService._();
  // ContactService() : super();

  // factory ContactService.getInstance() {
  //   return _contactService ??= ContactService._();
  // }

  @override
  Future<Either<String, Box>> openBox() async {
    try {
      return Right(Hive.box("contact"));
    } catch (e) {
      if (kDebugMode) {
        print("Error opening contact: $e");
      }
      return const Left(
          "Une erreur s'est produite lors de l'ouverture de la box");
    }
  }

  @override
  Future<Either<String, void>> addData(ContactModel data) async {
    try {
      // dynamic db = await openBox();

      Either<String, Box> db = await openBox();
      return db.fold((l) => Left(l), (r) async {
        await r.add(data);
        // await r.clear();
        return const Right(null);
      });
      // if (db.runtimeType == Box) {
      //   await db.add();
      //   print
      // }
      // return const Right(null);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Left("Une erreur s'est produite lors de l'ajout du contact");
    }
  }

  @override
  Future<Either<String, void>> editData(
      ContactModel oldData, ContactModel newData) async {
    try {
      dynamic db = await openBox();
      if (db.runtimeType == Box) {
        await db.put(oldData.hashCode, newData);
      }
      return const Right(null);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Left("Une erreur s'est produite lors de l'ajout du contact");
    }
  }

  @override
  Future<Either<String, List<ContactModel>>> getData() async {
    try {
      Either<String, Box> db = await openBox();
      return db.fold((l) => Left(l), (r) {
        List<ContactModel> contacts = [];
        for (int x = 0; x < r.length; x++) {
          contacts.add(r.getAt(x));
        }
        return Right(contacts);
      });
      // if (db.runtimeType == Right<String, Box>) {
      //   List<ContactModel> contacts = [];
      //   print(db.getAt(0));
      //   for (int x = 0; x < db.length; x++) {
      //     contacts.add(db.getAt(x));
      //   }
      //   return Right(contacts);
      // }
      // return const Left(
      //     "Une erreur s'est produite lors de la gestion de la box");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Left(
          "Une erreur s'est produite lors de la recuperation des contacts");
    }
  }

  @override
  Future<Either<String, bool>> removeData(ContactModel data) async {
    try {
      dynamic db = await openBox();
      if (db.runtimeType == Box) {
        await db.delete(data);
        return const Right(true);
      }
      return const Left(
          "Une erreur s'est produite lors de l'ouverture de la box");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return const Left(
          "Une erreur s'est produite lors de la recuperation des contacts");
    }
  }
}
