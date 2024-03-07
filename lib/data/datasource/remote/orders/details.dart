import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class OrdersDetailsData {
  Crud crud = Crud();
  OrdersDetailsData(this.crud);
  getData({required String ordersid}) async {
    var responce =
        await crud.postdata(AppLink.linkordersdetails, {"ordersid": ordersid});
    return responce.fold((l) => l, (r) => r);
  }
}
