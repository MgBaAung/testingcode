import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testingapp/base_architecture/app_setting/utils/size_utils.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
    this.readonly = false,
    this.labelText,
    this.horizontal = 16,
    this.onEditingComplete,
    this.inputFormatters,
    this.onTap,
  });

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final String? labelText;

  final FormFieldValidator<String>? validator;
  final bool? readonly;
  double horizontal = 16;
  final VoidCallback? onEditingComplete;

  List<TextInputFormatter>? inputFormatters;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Container(
    width: width ?? double.maxFinite,
    // padding: EdgeInsets.symmetric(horizontal: horizontal.h),
    child: TextFormField(
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      // scrollPadding: EdgeInsets.only(
      //   bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
      // ),
      controller: controller,
      //focusNode: focusNode ?? FocusNode(),
      // autofocus: autofocus!,
      // style: textStyle ??
      //     theme.textTheme.bodyMedium!.copyWith(
      //       color: appTheme.black900,
      //     ),
      obscureText: obscureText!,
      obscuringCharacter: "*",
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
      readOnly: readonly!,
      inputFormatters: inputFormatters,
    ),
  );

  InputDecoration get decoration => InputDecoration(
    labelText: labelText,
    // labelStyle:
    //     labelText != null ? TextStyle(color: appTheme.primaryColor) : null,
    hintText: hintText ?? "",
    hintStyle:
        hintStyle ??
        TextStyle(
          color: const Color(0xFF898989),
          fontSize: 14.fSize,
          fontWeight: FontWeight.w400,
        ),
    // theme.textTheme.bodyMedium!.copyWith(
    //   color: appTheme.gray60002,
    // ),
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding ?? const EdgeInsets.all(15),
    fillColor: fillColor,
    filled: filled,
    border: borderDecoration ?? const UnderlineInputBorder(),

    // OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(12.h),
    //   borderSide: const BorderSide(
    //     color: Colors.transparent, //Color(0xFFB6B6B6),
    //     width: 2,
    //   ),
    // ),
    enabledBorder: const UnderlineInputBorder(),
    // borderDecoration ??
    // OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(12.adaptSize),
    //   borderSide: const BorderSide(color: Color(0xFFB6B6B6), width: 1),
    // ),
    focusedBorder: const UnderlineInputBorder(),
    // borderDecoration ??
    // GradientOutlineInputBorder(
    //   gradient: const LinearGradient(
    //     colors: [Color(0xFF0910C2), Color(0xFF0098F5)],
    //   ),
    //   borderRadius: BorderRadius.circular(12.adaptSize),
    //   width: 2.0,
    // ),
    errorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFF4242), width: 1),
    ),
    // borderDecoration ??
    // OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(12.adaptSize),
    //   borderSide: const BorderSide(color: Color(0xFFFF4242), width: 1),
    // ),
  );
}

class SearchTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;
  final double? height;
  final double? top;
  final EdgeInsets? contentPadding;
  final double radius;
  final Function(String value)? onTextEditing;

  const SearchTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.height,
    this.top,
    this.onTextEditing,
    this.contentPadding,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(top: top ?? 20),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: (value) {
          onTextEditing?.call(value);
        },

        onTap: () {
          // widget.inputWidgetOnTap?.call();
        },
        onSubmitted: onChanged,
        // focusNode: widget.focusNode,
        controller: controller,
        maxLines: 1,

        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.3),
            borderRadius: BorderRadius.circular(radius.adaptSize),
          ),
          focusedBorder: GradientOutlineInputBorder(
            gradient: const LinearGradient(
              colors: [Color(0xFF0910C2), Color(0xFF0098F5)],
            ),
            borderRadius: BorderRadius.circular(radius.adaptSize),
            width: 2.0,
          ),

          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.3),
            borderRadius: BorderRadius.circular(radius.adaptSize),
          ),
          contentPadding:
              contentPadding ?? const EdgeInsets.fromLTRB(0, 20, 0, 20),
          //isCollapsed: true,
          labelStyle: TextStyle(
            fontSize: 16.fSize,
            color: const Color.fromRGBO(51, 51, 51, 1),
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xFF898989),
            fontSize: 12.fSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class GradientOutlineInputBorder extends OutlineInputBorder {
  final Gradient gradient;

  GradientOutlineInputBorder({
    required this.gradient,
    super.borderRadius = BorderRadius.zero,
    double width = 2.0,
  }) : super(
         borderSide: BorderSide(
           width: width,
           color: Colors.transparent, // Placeholder color
         ),
       );

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0,
    double gapPercentage = 0,
    TextDirection? textDirection,
  }) {
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderSide.width;

    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }
}
