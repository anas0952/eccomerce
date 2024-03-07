import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class ContactData {
  Crud crud = Crud();
  ContactData(this.crud);
  getdata(
      {required String usersid,
      required String title,
      required String body,
      required String number}) async {
    var resoponce = await crud.postdata(AppLink.linkcontactus,
        {"id": usersid, "title": title, "body": body, "number": number});
    return resoponce.fold((l) => l, (r) => r);
  }
}
