import 'package:code_queez/core/config/enum.dart';
import 'package:code_queez/core/config/extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final TextStyle? textStyle;
  final ButtonVariant variant;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.textStyle,
    this.isLoading = false,
    this.isDisabled = false,
    this.backgroundColor,
    this.textColor,
    this.variant = ButtonVariant.filled,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isDisabled || isLoading;
    final Color effectiveBackground = backgroundColor ?? context.tealGreen;
    final Color effectiveTextColor = textColor ??
        (variant == ButtonVariant.outlined
            ? effectiveBackground
            : Colors.white);

    return SizedBox(
      width: double.infinity,
      height: height ?? 48,
      child: ElevatedButton(
        onPressed: isButtonDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: variant == ButtonVariant.filled
              ? ((isButtonDisabled) ? Colors.grey : effectiveBackground)
              : Colors.transparent,
          foregroundColor: effectiveTextColor,
          elevation: (variant == ButtonVariant.filled) ? 2 : 0,
          side: BorderSide(
            color:
                (isButtonDisabled) ? Colors.grey.shade400 : effectiveBackground,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: (isLoading)
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: textStyle ??
                    context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: effectiveTextColor,
                    ),
              ),
      ),
    );
  }
}
