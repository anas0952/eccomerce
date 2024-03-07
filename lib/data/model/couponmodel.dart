class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDescount;
  String? couponExpiredate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDescount,
      this.couponExpiredate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDescount = json['coupon_descount'];
    couponExpiredate = json['coupon_expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_descount'] = this.couponDescount;
    data['coupon_expiredate'] = this.couponExpiredate;
    return data;
  }
}
