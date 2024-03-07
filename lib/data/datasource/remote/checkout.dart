import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class CheckOutData {
  Crud crud = Crud();
  CheckOutData(this.crud);
  getdata(
      {required String usersid,
      required String addressid,
      required String orderstype,
      required String ordersprice,
      required String pricedelivery,
      required String couponid,
      required String paymentmethod,
      required String discountcoupon}) async {
    var responce = await crud.postdata(AppLink.linkcheckout, {
      "usersid": usersid,
      "addressid": addressid,
      "orderstype": orderstype,
      "ordersprice": ordersprice,
      "pricedelivery": pricedelivery,
      "couponid": couponid,
      "paymentmethod": paymentmethod,
      "discountcoupon": discountcoupon
    });
    return responce.fold((l) => l, (r) => r);
  }
}
