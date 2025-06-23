import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback? onConfirm;
  final VoidCallback? onClose;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText = 'Oke',
    this.onConfirm,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: onConfirm ?? () => Navigator.of(context).pop(),
                  child: Text(confirmText),
                ),
              ],
            ),
          ),

          // Close button (pojok kanan atas)
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: onClose ?? () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
