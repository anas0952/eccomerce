import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class VeriFiycodeForgetPasswordData {
  Crud crud;
  VeriFiycodeForgetPasswordData(this.crud);

  postData(String email, String verfiycode) async {
    var responce = await crud.postdata(AppLink.linkveriFiycodeForgetPassword,
        {"email": email, "verfiycode": verfiycode});
    return responce.fold((l) => l, (r) => r);
  }
}
