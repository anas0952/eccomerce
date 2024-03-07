import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class PindingData {
  Crud crud = Crud();
  PindingData(this.crud);
  getDataPinding({required String usersid}) async {
    var responce =
        await crud.postdata(AppLink.linkorderpinding, {"usersid": usersid});
    return responce.fold((l) => l, (r) => r);
  }

  deleteorder({required String orderid}) async {
    var responce =
        await crud.postdata(AppLink.linkorderdelete, {"orderid": orderid});
    return responce.fold((l) => l, (r) => r);
  }
}
