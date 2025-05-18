import 'package:flutter/material.dart';
import 'package:exam_app/themes/colors.dart';

class SignUpTextFields extends StatefulWidget{
  final String hintText; 
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController ? confirmPasswordController;

  const SignUpTextFields({

    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.confirmPasswordController,

  });

  @override
  _SignUpTextFieldsState createState() => _SignUpTextFieldsState();

}

class _SignUpTextFieldsState extends State<SignUpTextFields>{
  bool _isObscured = true;
  String? _errorText;

  @override
  void initState(){
    super.initState();
    _isObscured = widget.isPassword;
  }
  
  void _validatePassword() {
    if (widget.isPassword &&
        widget.confirmPasswordController != null &&
        widget.confirmPasswordController!.text.isNotEmpty) {
      if (widget.controller.text != widget.confirmPasswordController!.text) {
        setState(() {
          _errorText = "Passwords do not match.";
        });
      } else {
        setState(() {
          _errorText = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _isObscured : false,
            keyboardType: widget.keyboardType,
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => _validatePassword(),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.textFieldFill,
              hintText: widget.hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColors.textFieldFocusedBorderSignup,
                  width: 2.0,
                ),
              ),
              hintStyle: TextStyle(
                color: AppColors.textFieldHint,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.passwordIcon,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
        if (_errorText != null) // Display warning below the field
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 16.0),
            child: Text(
              _errorText!,
              style: TextStyle(color: AppColors.error, fontSize: 14),
            ),
          ),
      ],
    );
  }
}
