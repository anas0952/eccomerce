import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class ResetpasswordData {
  Crud crud;
  ResetpasswordData(this.crud);

  postData(String email, String password) async {
    var responce = await crud.postdata(
        AppLink.linkresetpassword, {"email": email, "password": password});
    return responce.fold((l) => l, (r) => r);
  }
}
