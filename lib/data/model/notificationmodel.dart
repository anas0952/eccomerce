class NotificationModel {
  String? notificatoinId;
  String? notificatoinTitle;
  String? notificatoinBody;
  String? notificatoinUsers;
  String? notificatoinDatetime;

  NotificationModel(
      {this.notificatoinId,
      this.notificatoinTitle,
      this.notificatoinBody,
      this.notificatoinUsers,
      this.notificatoinDatetime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificatoinId = json['notificatoin_id'];
    notificatoinTitle = json['notificatoin_title'];
    notificatoinBody = json['notificatoin_body'];
    notificatoinUsers = json['notificatoin_users'];
    notificatoinDatetime = json['notificatoin_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificatoin_id'] = this.notificatoinId;
    data['notificatoin_title'] = this.notificatoinTitle;
    data['notificatoin_body'] = this.notificatoinBody;
    data['notificatoin_users'] = this.notificatoinUsers;
    data['notificatoin_datetime'] = this.notificatoinDatetime;
    return data;
  }
}
