import 'package:untitled/core/class/statusrequest.dart';

hanglingdata(responce) {
  if (responce is Statusrequest) {
    return responce;
  } else {
    return Statusrequest.success;
  }
}
