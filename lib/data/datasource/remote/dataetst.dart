import 'package:untitled/linkapi.dart';

import '../../../core/class/crud.dart';

class Testdata {
  Crud crud;
  Testdata(this.crud);

  getdata() async {
    var responce = await crud.postdata(AppLink.linktest, {});
    print(responce);
    return responce.fold((l) => l, (r) => r);
  }
}
