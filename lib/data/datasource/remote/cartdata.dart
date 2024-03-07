import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String usersid, String itemsid) async {
    var responce = await crud.postdata(
        AppLink.linkcartadd, {"usersid": usersid, "itemsid": itemsid});
    return responce.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var responce = await crud.postdata(
        AppLink.linkcartdelete, {"usersid": usersid, "itemsid": itemsid});
    return responce.fold((l) => l, (r) => r);
  }

  getcountcart(String usersid, String itemsid) async {
    var responce = await crud.postdata(
        AppLink.linkgetcountcart, {"usersid": usersid, "itemsid": itemsid});
    return responce.fold((l) => l, (r) => r);
  }

  viewcart(String usersid) async {
    var responce =
        await crud.postdata(AppLink.linkcartview, {"usersid": usersid});
    return responce.fold((l) => l, (r) => r);
  }

  checkcoupon(String couponname) async {
    var responce =
        await crud.postdata(AppLink.linkcoupon, {"couponname": couponname});
    return responce.fold((l) => l, (r) => r);
  }

  // getDataimages(String itemsid) async {
  //   var responce =
  //       await crud.postdata(AppLink.linkitemsimages, {"itemsid": itemsid});
  //   return responce.fold((l) => l, (r) => r);
  // }
}
