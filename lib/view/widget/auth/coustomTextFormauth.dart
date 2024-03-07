import 'package:flutter/material.dart';

class CoustomTextFormaAuth extends StatelessWidget {
  final String hintext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final bool type;
  final bool? obscureText;
  final void Function()? onTapicon;
  // final void Function()?

  const CoustomTextFormaAuth({
    super.key,
    required this.hintext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.validator,
    required this.type,
    this.obscureText,
    this.onTapicon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 17),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: type
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        controller: mycontroller,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(labeltext, style: const TextStyle(fontSize: 22))),
            suffixIcon: InkWell(onTap: onTapicon, child: Icon(iconData)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
