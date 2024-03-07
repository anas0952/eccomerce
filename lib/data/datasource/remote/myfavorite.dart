import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData(String usersid) async {
    var responce = await crud.postdata(AppLink.linkmyfavorite, {"id": usersid});
    return responce.fold((l) => l, (r) => r);
  }

  deletData(String id) async {
    var responce =
        await crud.postdata(AppLink.linkdeletfromfavorite, {"id": id});
    return responce.fold((l) => l, (r) => r);
  }
}
