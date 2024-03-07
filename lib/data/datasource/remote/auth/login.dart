import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var responce = await crud
        .postdata(AppLink.linkLogin, {"email": email, "password": password});
    return responce.fold((l) => l, (r) => r);
  }
}
