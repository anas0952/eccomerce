import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class OrdersArchive {
  Crud crud = Crud();
  OrdersArchive(this.crud);

  getDataArchive({required String usersid}) async {
    var responce =
        await crud.postdata(AppLink.linkorderdArchive, {"ordersuser": usersid});
    return responce.fold((l) => l, (r) => r);
  }

  getDatarating(
      {required String ordersid,
      required String rating,
      required String noterating}) async {
    var responce = await crud.postdata(AppLink.linkorderrating,
        {"id": ordersid, "rating": rating, "noterating": noterating});
    return responce.fold((l) => l, (r) => r);
  }
}
