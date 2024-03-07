class AppLink {
  static const String linkserver = "https://storeapp952.000webhostapp.com";
  static const String linkimage =
      "https://storeapp952.000webhostapp.com/upload";
  // https://storeapp952.000webhostapp.com/upload/cat/camera.svg
  //==================================Image=====================
  static const String linkimagecategories = "$linkimage/cat";
  static const String linkimageitems = "$linkimage/items";
  //=======================================================
  static const String linktest = "$linkserver/test.php";

  //=====================================Auth===================================================================
  static const String linkSignUp = "$linkserver/auth/signup.php";
  static const String linkverfycode = "$linkserver/auth/verficode.php";
  static const String linkLogin = "$linkserver/auth/login.php";
  static const String linkresend = "$linkserver/auth/resend.php";

  //=====================================Forget password ===================================================================
  static const String linkveriFiycodeForgetPassword =
      "$linkserver/forgetpassword/verifiycode.php";
  static const String linkcheckEmail =
      "$linkserver/forgetpassword/checkemail.php";
  static const String linkresetpassword =
      "$linkserver/forgetpassword/resetpasssword.php";

  //=====================================Homee  ===================================================================
  static const String linkhomepage = "$linkserver/home.php";
  static const String linknotification = "$linkserver/notification.php";
  static const String linknotificationDelete = "$linkserver/deletnotify.php";

  //=====================================aaddress  ===================================================================
  static const String linkcontactus = "$linkserver/contactus.php";

  //===================================== ===================================================================

  //=================================items=================
  static const String linkitems = "$linkserver/items/items.php";
  static const String linksearch = "$linkserver/items/search.php";
  static const String linkitemsstars = "$linkserver/items/stars.php";
  static const String linkitemsimages = "$linkserver/items/images.php";

  //imagesitems

  //=====================================Favirot  ===================================================================
  static const String linkfavoritadd = "$linkserver/favorite/add.php";
  static const String linkfavoritdelete = "$linkserver/favorite/remove.php";
  static const String linkmyfavorite = "$linkserver/favorite/view.php";
  static const String linkdeletfromfavorite =
      "$linkserver/favorite/deletefromfavorite.php";
  //=====================================CART  ===================================================================
  static const String linkcartview = "$linkserver/cart/view.php";
  static const String linkcartadd = "$linkserver/cart/add.php";
  static const String linkcartdelete = "$linkserver/cart/delete.php";
  static const String linkgetcountcart = "$linkserver/cart/getcountcart.php";

  //=====================================address  ===================================================================
  static const String linkaddressview = "$linkserver/address/view.php";
  static const String linkaddressadd = "$linkserver/address/add.php";
  static const String linkaddressedit = "$linkserver/address/edit.php";
  static const String linkaddressvDelete = "$linkserver/address/delete.php";
  //===================================== coupon  ===================================================================
  static const String linkcoupon = "$linkserver/coupon/checkcoupon.php";
  //=====================================check Out orders ===================================================================
  static const String linkcheckout = "$linkserver/orders/checkout.php";
  static const String linkorderpinding = "$linkserver/orders/pending.php";
  static const String linkorderarchive = "$linkserver/orders/archive.php";
  static const String linkordersdetails = "$linkserver/orders/details.php";
  static const String linkorderdelete = "$linkserver/orders/delete.php";
  static const String linkorderdArchive = "$linkserver/orders/archive.php";
  //rating
  static const String linkorderrating = "$linkserver/orders/rating.php";

  //=====================================offerse===================================================================
  static const String linkofferse = "$linkserver/offerse.php";
  static const String linklistofferse = "$linkserver/listofferse.php";
}
