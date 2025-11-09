import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? hint;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? prefixText;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final int? maxLines;
  final AutovalidateMode? autovalidateMode;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? helperText;
  final void Function()? onClickSuffixIcon;
  final String? initialValue;
  final String? label;

  const AppTextField({
    this.textEditingController,
    this.hint,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.prefixText,
    this.readOnly,
    this.suffixIcon,
    this.suffix,
    this.label,
    this.prefixIcon,
    this.onTap,
    this.maxLines,
    this.autovalidateMode,
    this.enabled,
    this.inputFormatters,
    this.errorText,
    this.helperText,
    this.onClickSuffixIcon,
    this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xFF000000),
            ),
          ),
        TextFormField(
          controller: textEditingController,
          onChanged: onChanged,
          validator: validator,
          initialValue: initialValue,
          keyboardType: keyboardType,
          textInputAction: textInputAction ?? TextInputAction.next,
          autovalidateMode: autovalidateMode,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: hint,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            prefixText: prefixText,
            prefixStyle: const TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Color(0xFF296234)),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            hintStyle: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
            suffixIcon: suffixIcon != null
                ? IconButton(icon: suffixIcon!, onPressed: onClickSuffixIcon)
                : null,
            suffix: suffix,
            prefixIcon: prefixIcon,
            errorText: errorText,
            helperText: helperText,
          ),
          inputFormatters: inputFormatters == null
              ? [LengthLimitingTextInputFormatter(maxLength)]
              : [
                  LengthLimitingTextInputFormatter(maxLength),
                  ...inputFormatters!,
                ],
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF002F49)),
          readOnly: readOnly ?? false,
          onTap: onTap,
          maxLines: maxLines,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
