import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "title": "تسجيل الدخول",
          //signup AR ,
          "titlesuccess": "انتقل إلى صفحة تسجيل الدخول",
          "tetleSignup": "انشاء الحساب",
          "1": "اختر اللغة ",
          "2": "أهلا بعودتك",
          //forget
          "2forget": "تحقق من البريد الالكتروني",
          "3forget": "تسجيل النجاح بواسطة",
          "4forget": "ادخل عنوان البريد الالكتروني الى رمز التحقق",
          //end forget check email
          "3":
              "تسجيل الدخول باستخدام بريدك الإلكتروني وكلمة المرور التي تحتوي على وسائل التواصل الاجتماعي ",
          //Titlesign Up
          "bodySignUp":
              " انشاء الحساب باستخدام بريدك الإلكتروني وكلمة المرور التي تحتوي على وسائل التواصل الاجتماع",
          "bodyforgetpassword": "الرجاء التاكد من البريد الالكتروني",
          "4": "الايميل",
          "5": "أدخل بريدك الإلكتروني",
          "6": "كلمة المرور",
          //repassword
          "6pass": "إعادة تعيين كلمة المرور",
          //repassword
          "7": "أدخل كلمة السر",
          "8": "نسيت كلمة المرور",
          "9": "ليس لديك حساب ؟",
          "10": "انشاء الحساب",
          //sign up
          "10SignUp": "تسجيل دخول",
          //signup
          "10sign": " العودة الى صفحة ",
          //forgetSignup
          "10forget": "نسيت كلمة المرور",
          //Feryfycode
          "10Feryfycode": "رمز التحقق",
          "11": "أسم المستخدم",
          "12": "أدخل اسم المستخدم الخاص بك",
          "13": "رقم الهاتف",
          "14": "أدخل رقم الهاتف",
          //check => forget
          "15": "تحقق",
          "15code": "رمز التحقق",
          "15pass": "إعادة تعيين كلمة المرور",
          //success
          "success":
              "  عملية تسجيل الدخول تمت بنجاح يمكنك العودة الى صفحة تسجيل الدخول 😁",
          "successs": "....تهانينا",
          "successAppbar": "المهمة أنجزت",
          //Boarding
          "track":
              "يمكنك تتبع طلبك في كل مرحلة وايضا \n التتبع من خلال الخريطة ",
          "titletrack": "تتبع طلبك",
          "order": "توصيل موثوق وسريع \nنقدم منتجاتك بأسرع طريقة ممكنة",
          "titleorder": "توصيل سريع",
          "easytitle": "دفع سهل وآمن",
          "easy":
              "طريقة دفع سهلة وآمنة \nموثوق به من قبل عملائنا من جميع أنحاء العالم",
          "producttitle": "اختر المنتج",
          "product":
              "لدينا 100 ألف + منتج \nاختر منتجاتك من متجر التجارة الإلكترونية الخاص بنا",
          "con": "متابعة",
          //textfailed
          "1txt": "يرجى ملء هذا الحقل",
          "2txt": "اسم المستخدم غير صالح",
          "3txt": "البريد الإلكتروني غير صالح",
          "4txt": "رقم الهاتف غير صالح",
          "5txt": " لا يمكن أن تكون القيمة أصغر من",
          "6txt": "  لا يمكن أن تكون القيمة أكبر من",
          "7txt": "كلمة المرور غير صالحة",
          //app end
          "app1": "هل تريد الخروج من التطبيق !",
          "app2": "موافق",
          "app3": "تجاهل",
          "app4": "تنبيه",
          //home
          "home1": "تخفيضات الصيف ",
          "home2": "اكثر من 20 %",
          "home3": "الأقسام",
          "home4": "المنتجات الأكثر مبيعا",
          "home5": "العروض",
          "home6": "ابحث عن المنتج",
          //ferfycode => update
          "ferfycode": "اعادة ارسال رمز التحقق",
          //cart

          //locationservices
          "per1": "تنبيه",
          "per2": "خدمات الموقع معطلة",
          "per3": "تم رفض أذونات الموقع",
          "per4": "تم رفض أذونات الموقع بشكل دائم ، ولا يمكننا طلب أذونات",
          "location": " تتمة معلومات الموقع",
          "locationtop": "إضافة عنوان جديد",
          "locationstart": "العنوان",
          //cart to payment

          //orders
          "100": "استلام",
          "100a": "توصيل",
          "101": "تفاصيل الطلب",
          "101a": "حذف الطلب",
          "111": "رقم الطلب",
          "102": "نوع الطلب ",
          "103": "سعر الطلب",
          "104": "سعر التسليم",
          "105": "طرق الدفع ",
          "105a": "نقدي",
          "105aa": "الدفع من خلال إحدى طرق الدفع الإلكتروني",
          "106": "السعر الاجمالي",
          "107": "في انتظار الموافقة ",
          "108": "قيد التحضير",
          "109": "على الطريق ",
          "109a": "جاهز للاستلام من قبل رجل التوصيل",
          "110": "في حالة الارشفة ",
          "112": "حالة الطلب ",

          //notify
          "notify": "الاشعارات الخاصة بي ",
          //details

          "details1": "تفاصيل الطلب ",
          "details2": "العناصر",
          "details3": "الكمية ",
          "details4": "  السعرالاجمالي مع التوصيل ",
          "details5": "السعر ",
          "rating1": "مربع حوار التصنيف",
          "rating2":
              "انقر على نجمة لتعيين تقييمك. أضف المزيد من الوصف هنا إذا كنت تريد",
          "rating3": "إرسال",
          //checkout
          "checkout1": "",
          "checkout2": "",
          "checkout3": "",
          "checkout4": "",
          "checkout5": "",
          "checkout6": "",
          "checkout7":
              "يرجى الانتقال إلى صفحة العنوان لإكمال عملية الشراء أضغط هنا ",
          "checkout7a": "تعيين العنوان"
        },
        "en": {
          "title": "Sign In",
          //signup
          "titlesuccess": "Go To Login",
          "tetleSignup": "Sign Up",
          "1": "Choose Languag ",
          "2": "Welcome Back",
          //forget
          "2forget": "CheckEmail",
          //checkemail
          "3forget": "Success Registration by",
          "4forget": "plase Enter Your Email Address To Vrrification code",
          //end cheak && body
          "3":
              "Sign In With Your Email And Password Containue With Social Media ",
          //signup Title
          "bodySignUp":
              "Sign Up With Your Email And Password Containue With Social Media",
          "bodyforgetpassword": "Please Check The email",
          "4": "Email",
          "5": "Enter Your Email",
          "6": "Password",
          "7": "Enter Your password",
          //Repassword
          "6pass": "Reset Password",
          "8": "Forget Passowrd",
          "9": "Don't Have an account ?",
          "10": "Sign Up",
          //sign up
          "10SignUp": "Sign In",
          //signup
          "10sign": "Back to  ",
          //forget
          "10Feryfycode": "Verification Code",
          "10forget": "ForgetPassword",
          "11": "Username",
          "12": "Enter Your Username",
          "13": "Enter Your Phone",
          "14": "Enter Your Phone",
          "15": "Check ",
          "15pass": "Check password",
          "15code": "Check Code ",
          "success":
              "The login process was Successful you can return to the page Login 😁 ",
          "successs": "Congratulations.....",
          "successAppbar": "Mission Accomplished",
          //Boarding
          "track":
              "You can Track your order \n at each Stage  and also  track Through the map ",
          "titletrack": "Track Your Order",
          "order":
              "Relible and Fast Delivery we \n Deliver your products the fastest \n way possible",
          "titleorder": "Fast Delivery",
          "easytitle": "Easy And safe payment",
          "easy":
              "EasyCheckOut AND Safe payment \n method Trusted by our coustomers \n from all over the world",
          "producttitle": "Choose Product",
          "product":
              "We have A 100k+ products Choose \n your products From Our FromE- \n commerce Shop",
          "con": "Continue",
          //textFiled
          "1txt": "Please this Field must be Filled ",
          "2txt": "Username is not valid",
          "3txt": "Email is not valid",
          "4txt": "Phone is not valid",
          "5txt": "The value cannot be Smaller than",
          "6txt": "The value cannot be Greater than",
          "7txt": "Password is not valid",
          //end app
          "app1": "Do you want to exit the app !",
          "app2": "Confirm",
          "app3": "Ignore",
          "app4": "Alert",
          //home
          "home1": "Summer Sale",
          "home2": "More than 20 %",
          "home3": "Categories",
          "home4": "Top Selling Products",
          "home5": "Offers",
          "home6": "Find Product",
          //verficode => update
          "ferfycode": "Resend Verification Code",
          //my cart

          //settings permistion
          "per1": "Alert",
          "per2": "Location services are disabled",
          "per3": "Location permissions are denied",
          "per4":
              "Location permissions are permanently denied, we cannot request permissions",
          //location
          "location": "Location Information Continuation",
          "locationtop": "Add New Address",
          "locationstart": "Address",
          //ORDERS PINDING
          "100": "Receive",
          "100a": "delivery",
          "101": "Details",
          "101a": "Delete",
          "102": "OrderType",
          "103": "Order Price",
          "104": "delivery Price",
          "105": "Payment Method",
          "105a": "Cash payment",
          "105aa": "Payment through one of the electronic payment methods",
          "106": "Total Price",
          "107": "Await Approval ",
          "108": "In preparation",
          "109": "On the Road ",
          "109a": "Ready To Picked up by Delivery man",
          "110": "In the Case of Archiving",
          "111": "Order Number ",
          "112": "Order Status",

          //notify
          "notify": "My Notifications ",
          //orderdetails
          "details1": "Orders Details",
          "details2": "Items",
          "details3": "QTY",
          "details4": "Total price with delivery ",
          "details5": "Price",

          //rating page
          "rating1": "Rating Dialog",
          "rating2":
              "Tap a star to set your rating. Add more description here if you want",
          "rating3": "Submit",
          "rating4": "Set your custom comment hint",
          //checkOut
          "checkout1": "",
          "checkout2": "",
          "checkout3": "",
          "checkout4": "",
          "checkout5": "",
          "checkout6": "",
          "checkout7":
              "Please go to the address page to complete your purchase  ",
          "checkout7a": "Address Assignment"
        }
      };
}
