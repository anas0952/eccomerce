import 'package:untitled/core/class/crud.dart';
import 'package:untitled/linkapi.dart';

class NotificationData {
  Crud crud = Crud();
  NotificationData(this.crud);
  getDataNotify({required String usersid}) async {
    var responce =
        await crud.postdata(AppLink.linknotification, {"usersid": usersid});
    return responce.fold((l) => l, (r) => r);
  }

  deletedatanotify({required String id}) async {
    var responce =
        await crud.postdata(AppLink.linknotificationDelete, {"id": id});
    return responce.fold((l) => l, (r) => r);
  }
}
