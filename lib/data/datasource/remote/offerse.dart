import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class OfferseData {
  Crud crud = Crud();
  OfferseData(this.crud);
  getDataofferse() async {
    var responce = await crud.postdata(AppLink.linkofferse, {});
    return responce.fold((l) => l, (r) => r);
  }
}
