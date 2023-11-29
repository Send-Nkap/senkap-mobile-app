import 'package:get/get.dart';

class TransactionController extends GetxController {
  RxBool isLastTransactionDetailsActivated = false.obs;
  RxInt selectedTransaction = (-1).obs;

  // RxBool isContactAcessGranted = false.obs;
  // List<Contact> contacts = (List<Contact>.of([])).obs;

  // TODO: review if it is necessary to create a controller for transfers
  RxString amount = "0".obs;

  void updateAmount(String newValue) {
    if (amount.value == "0") {
      amount(newValue);
      return;
    }
    if (amount.value.length < 7) {
      amount(amount + newValue);
    }
  }

  void clearAmount() {
    amount("0");
  }

  void deleteAmount() {
    if (amount.value.length > 1) {
      amount(amount.value.substring(0, amount.value.length - 1));
    } else {
      clearAmount();
    }
  }

  // void getContacts() async {
  //   contacts.clear();
  //   if (await Permission.contacts.request().isGranted) {
  //     // Either the permission was already granted before or the user just granted it.
  //     // Get all contacts without thumbnail (faster)
  //     isContactAcessGranted(true);
  //     List<Contact> newContacts =
  //         (await ContactsService.getContacts(withThumbnails: false));
  //     for (var contact in newContacts) {
  //       if (contact.phones != null && contact.phones!.isNotEmpty) {
  //         if (!contacts.contains(contact)) {
  //           // contact.phones![0].value =
  //           //     formatPhoneNumber(contact.phones![0].value!);
  //           String newPhone = formatPhoneNumber(contact.phones![0].value!);
  //           if (newPhone != "Invalid phone number format") {
  //             contact.phones![0].value = newPhone;
  //             contacts.add(contact);
  //           }
  //           print(contact.toMap());
  //         }
  //       }
  //     }
  //     newContacts.toSet();
  //     // TODO: check if each contact is already on Send Nkap
  //   }
  // }

  @override
  void onInit() {
    clearAmount();
    super.onInit();
  }

  @override
  void onClose() {
    clearAmount();
    super.onClose();
  }
}
