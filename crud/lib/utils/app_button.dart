import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget? label;
  final VoidCallback? onPressed;
  final bool? isLoading;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width, height;
  final String? title;

  const AppButton({
    this.label,
    required this.onPressed,
    this.isLoading = false,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
    this.title,
    super.key,
  }) : assert(
         (label == null) != (title == null),
         'Provide either label or title, not both.',
       );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color adaptiveBg = bgColor ?? theme.primaryColor;

    final Color adaptiveText =
        textColor ??
        (theme.brightness == Brightness.light ? Colors.white : Colors.black);

    final Color adaptiveBorder = borderColor ?? theme.primaryColor;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: onPressed != null ? adaptiveBg : Colors.grey[600],
          side: BorderSide(
            color: onPressed != null ? adaptiveBorder : Colors.grey,
            width: 2,
          ),
        ),
        onPressed: isLoading == true ? null : onPressed,
        child: isLoading == true
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : (label ??
                  Text(
                    title!,
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: adaptiveText,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
      ),
    );
  }
}
