import 'package:flutter/material.dart';

class TextEditView extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? fillColor;
  final GestureTapCallback? onTap;
  var inputFormatter;
  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final bool autofocus;
  final bool autocorrect;
  final bool obscureText;
  final double borderRadius;
  final double borderWidth;
  final bool isDense;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final int? maxLines;
  final int? maxLength;
  final bool filled;
  final String? prefixText;
  final String? helperText;
  final Color? iconColor;
  final Color? textColor;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
    TextEditView(
      {Key? key,
      this.onChanged,
      required this.controller,
      this.fillColor,
      this.onTap,
      this.keyboardType,
      this.textInputAction,
      this.validator,
      this.inputFormatter,
      this.readOnly = false,
      this.autofocus = false,
      this.autocorrect = false,
      this.obscureText = false,
      this.isDense = false,
      this.labelText,
      this.hintText,
      this.onFieldSubmitted,
      this.borderRadius = 8.0,
      this.borderWidth = 1.5,
      this.suffixIcon,
      this.iconColor,
      this.textColor,
      this.prefixIcon,
      this.borderColor,
      this.filled = true,
      this.prefixText,
      this.autofillHints,
      this.focusNode,
      this.helperText,
      this.maxLength,
      
      this.maxLines = 1})
      : super(key: key);

  OutlineInputBorder _border(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(
          width: borderWidth,
          color: borderColor ?? Theme.of(context).shadowColor.withOpacity(0.1),
          style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: Theme.of(context).colorScheme.secondary)),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          autocorrect: autocorrect,
          readOnly: readOnly,
          autofocus: autofocus,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          autofillHints: autofillHints,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,
          inputFormatters: inputFormatter,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
              border: _border(context),
              enabledBorder: _border(context),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      width: borderWidth,
                      color: Theme.of(context).colorScheme.secondary,
                      style: BorderStyle.solid)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      width: borderWidth,
                      color:
                          borderColor ?? Theme.of(context).colorScheme.secondary,
                      style: BorderStyle.solid)),
              errorBorder: _border(context),
              disabledBorder: _border(context),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              labelText: labelText,
              labelStyle: TextStyle(color: textColor),
              filled: filled,
              isDense: isDense,
              fillColor:
                  fillColor ?? Theme.of(context).shadowColor.withOpacity(0.05),
              helperText: helperText,
              helperMaxLines: 2,
              helperStyle: const TextStyle(fontSize: 10),
              prefixText: prefixText,
              prefixIcon: prefixIcon,
              iconColor: iconColor,
              prefixIconColor: iconColor,
              suffixIcon: suffixIcon,
              suffixIconColor: iconColor),
        ),
      ),
    );
  }
}

class BorderlessField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final String? hintText;
  final FocusNode? focusNode;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;

  const BorderlessField(
      {Key? key,
      this.onChanged,
      required this.controller,
      this.hintText,
      this.autofocus = false,
      this.focusNode,
      this.validator,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(
        fontSize: 38,
        textBaseline: TextBaseline.alphabetic,
        fontWeight: FontWeight.w300,
      ),
      decoration: const InputDecoration(
        labelText: '',
        border: InputBorder.none,
      ),
    );
  }
} 