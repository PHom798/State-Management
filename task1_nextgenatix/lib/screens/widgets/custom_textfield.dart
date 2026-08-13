import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextInputType? keyboardType;
 // final bool obscureText;
  final bool isPassword;
  final TextEditingController? controll;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?) ? validator;
  const AppTextField({
    super.key,
    //.obscureText = false,
    required this.hintText,
    this.keyboardType,
    required this.prefixIcon,
    this.suffixIcon, this.validator, required this.isPassword, this.controll
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
   late bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controll,

      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _isObscured,
      decoration: InputDecoration(

        hintText: widget.hintText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon:widget.isPassword? IconButton(onPressed: (){
          setState(() {
            _isObscured =!_isObscured;
          });
        }, icon:Icon(_isObscured ? Icons.visibility_off_outlined: Icons.visibility_outlined ),
      ):null,
    ));
  }
}
