import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool? isPasswordVisible;
  final VoidCallback? onTogglePasswordVisibility;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.icon,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.isPasswordVisible,
    this.onTogglePasswordVisibility,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: TextFormField(
        enabled: true,
        controller: controller,
        obscureText: isPassword && !(isPasswordVisible ?? false),
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        validator: validator,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
        style: const TextStyle(color: Colors.white),
        onFieldSubmitted: (value) {
          FocusScope.of(context).unfocus();
          if (onFieldSubmitted != null) {
            onFieldSubmitted!(value);
          }
        },
        inputFormatters:
            isPassword
                ? [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z0-9!@#$%^&*]'),
                  ),
                ]
                : null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 16,
          ),
          prefixIcon: Icon(icon, color: Colors.white, size: 22),
          suffixIcon:
              isPassword
                  ? IconButton(
                    icon: Icon(
                      isPasswordVisible ?? false
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                    onPressed: onTogglePasswordVisibility,
                  )
                  : null,
          filled: false,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}

//! Usage example:
/*
CustomTextFormField(
  label: 'user name',
  icon: Icons.person_outline,
  controller: _usernameController,
),

CustomTextFormField(
  label: 'password',
  icon: Icons.lock_outline,
  isPassword: true,
  isPasswordVisible: _isPasswordVisible,
  onTogglePasswordVisibility: () {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  },
  controller: _passwordController,
),
*/
