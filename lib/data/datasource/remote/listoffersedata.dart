import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class ListOfferseData {
  Crud crud = Crud();
  ListOfferseData(this.crud);
  getdata() async {
    var responce = await crud.postdata(AppLink.linklistofferse, {});
    return responce.fold((l) => l, (r) => r);
  }
}
