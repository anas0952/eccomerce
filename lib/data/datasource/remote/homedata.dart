import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var responce = await crud.postdata(AppLink.linkhomepage, {});
    return responce.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var responce = await crud.postdata(AppLink.linksearch, {"search": search});
    return responce.fold((l) => l, (r) => r);
  }
}
