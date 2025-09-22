import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.icon,
    this.suffixIcon,
    this.onSufixTaped,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hint;
  final IconData? icon;
  final IconData? suffixIcon;
  final Function()? onSufixTaped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MovieAppColors.lightGrey.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          hint: Text(
            hint,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                ),
          ),
          border: InputBorder.none,
          icon: icon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(icon),
                )
              : null,
          suffixIcon: IconButton(
              onPressed: () {
                if (onSufixTaped != null) {
                  onSufixTaped!();
                }
              },
              icon: Icon(suffixIcon)),
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
