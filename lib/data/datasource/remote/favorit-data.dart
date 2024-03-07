import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class FavoritData {
  Crud crud;
  FavoritData(this.crud);

  addFavorit(String usersid, String itemsid) async {
    var responce = await crud.postdata(
        AppLink.linkfavoritadd, {"usersid": usersid, "itemsid": itemsid});
    return responce.fold((l) => l, (r) => r);
  }

  removeFavorit(String usersid, String itemsid) async {
    var responce = await crud.postdata(
        AppLink.linkfavoritdelete, {"usersid": usersid, "itemsid": itemsid});
    return responce.fold((l) => l, (r) => r);
  }
}
