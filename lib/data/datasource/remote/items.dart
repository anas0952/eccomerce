import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String id, String usersid) async {
    var responce = await crud
        .postdata(AppLink.linkitems, {"id": id.toString(), "usersid": usersid});
    return responce.fold((l) => l, (r) => r);
  }

  getDatastars(String usersid, String itemsid, String stars) async {
    var responce = await crud.postdata(AppLink.linkitemsstars,
        {"usersid": usersid.toString(), "itemsid": itemsid, "stars": stars});
    return responce.fold((l) => l, (r) => r);
  }
}


//data 