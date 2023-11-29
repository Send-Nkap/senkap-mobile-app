import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/contact_model.dart';
import '../ressources/commons.dart';
import '../services/contact_service.dart';

class ContactController extends GetxController {
  RxBool isContactAcessGranted = false.obs;
  RxList<Contact> contacts = (List<Contact>.of([])).obs;
  RxList<Contact> searchContacts = (List<Contact>.of([])).obs;
  RxList<ContactModel> recentContacts = (List<ContactModel>.of([])).obs;
  final ContactService _contactService = ContactService();

  Future<void> getContacts() async {
    contacts.clear();
    if (await Permission.contacts.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      // Get all contacts without thumbnail (faster)
      isContactAcessGranted(true);
      List<Contact> newContacts =
          (await ContactsService.getContacts(withThumbnails: false));
      for (var contact in newContacts) {
        if (contact.phones != null && contact.phones!.isNotEmpty) {
          if (!contacts.contains(contact)) {
            // contact.phones![0].value =
            //     formatPhoneNumber(contact.phones![0].value!);
            String newPhone =
                Commons.formatPhoneNumber(contact.phones![0].value!);
            if (newPhone != "Invalid phone number format") {
              contact.phones![0].value = newPhone;
              contacts.add(contact);
            }
            // print(contact.toMap());
          }
        }
      }
      newContacts.toSet();
      searchContacts(contacts);
      // TODO: check if each contact is already on Send Nkap
    }
  }

  bool isName(String input) {
    // Ajoutez ici votre logique de validation pour un nom
    // // Par exemple, vous pourriez vérifier s'il contient des espaces ou est composé de caractères alphabétiques.
    return !input.contains("+237");
    // return !input.contains(
    //     RegExp(r'[0-9]')); // Vérification simple sans caractères numériques
  }

  bool isPhoneNumber(String input) {
    // Ajoutez ici votre logique de validation pour un numéro de téléphone
    // Peut-être en utilisant la longueur ou le format spécifique du numéro.
    return input.startsWith('+') &&
        input.length > 5; // Vérification simple pour un numéro international
  }

  void addContactToRecents(ContactModel contact) async {
    bool isContactAleadyInRecent = moveContactToTop(contact);
    if (!isContactAleadyInRecent) {
      dynamic result = await _contactService.addData(contact);
      print(result);
      if (result.runtimeType != Left<String, void>) {
        // getRecentContacts();
      } else {
        // TODO: add action here for error (display the message)
      }
    }
  }

  void getRecentContacts() async {
    dynamic result = await _contactService.getData();
    // ignore: void_checks
    return result.fold((l) => Left(l), (r) {
      print(r);
      if (recentContacts.isEmpty) {
        recentContacts(r);
      }
      return Right(recentContacts);
    });
    // print(result);
    // if (result.runtimeType == Left<String, List<ContactModel>>) {
    //   // TODO: add action here for error (display the message)
    // } else {
    //   recentContacts = result;
    // }
  }

  bool moveContactToTop(ContactModel newContact) {
    int existingContactIndex = recentContacts.indexWhere((contact) =>
        contact.name == newContact.name || contact.phone == newContact.phone);

    if (existingContactIndex != -1) {
      // Si le contact existe déjà, le placer en première position et décaler les autres éléments
      ContactModel existingContact =
          recentContacts.removeAt(existingContactIndex);
      recentContacts.insert(0, existingContact);
      return true; // Le contact existait déjà dans la liste
    } else {
      // Si le contact n'existe pas, l'ajouter en première position
      recentContacts.insert(0, newContact);
      return false; // Le contact n'existait pas dans la liste
    }
  }

  void searchAContact({required String input}) {
    bool isNameSearched = isName(input);
    bool isPhoneNumberSearched = input.startsWith('+') ||
        int.tryParse(input) != null ||
        input.startsWith('6');
    print(isPhoneNumberSearched);
    if (isNameSearched) {
      searchContacts(contacts
          .where((cont) =>
              cont.displayName?.contains(input) ??
              cont.familyName?.contains(input) ??
              cont.givenName?.contains(input) ??
              cont.middleName?.contains(input) ??
              false)
          .toList());
    } else if (isPhoneNumberSearched) {
      searchContacts(contacts.where((contact) {
        // Vérifier si le numéro de téléphone de ce contact contient la valeur 'input'
        return contact.phones!.any((phone) => phone.value!.contains(input));
      }).toList());
    }
  }

  @override
  void onInit() async {
    if (await Permission.contacts.isGranted) {
      getContacts();
    }
    getRecentContacts();
    super.onInit();
  }
}
