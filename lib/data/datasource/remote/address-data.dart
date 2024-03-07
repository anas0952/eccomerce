import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addData(String usersid, String city, String street, String lat, String long,
      String name) async {
    var responce = await crud.postdata(AppLink.linkaddressadd, {
      "usersid": usersid,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "name": name
    });
    return responce.fold((l) => l, (r) => r);
  }

  getData(String usersid) async {
    var responce =
        await crud.postdata(AppLink.linkaddressview, {"usersid": usersid});
    return responce.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var responce = await crud
        .postdata(AppLink.linkaddressvDelete, {"addressid": addressid});
    return responce.fold((l) => l, (r) => r);
  }

  editData(String addressid, String city, String street, String lat,
      String name, String long) async {
    var responce = await crud.postdata(AppLink.linkaddressedit, {
      "addressid": addressid,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "name": name
    });
    return responce.fold((l) => l, (r) => r);
  }
}
