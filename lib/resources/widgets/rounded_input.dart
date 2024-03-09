import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter/resources/utils/app/app_theme.dart';
import 'package:test_flutter/resources/widgets/input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput(
      {Key? key,
      this.icon,
      required this.hint,
      required this.textEditingController,
      this.textInputType = TextInputType.text,
      this.imageAsset,
      this.onTap,
      this.maxLines = 1,
      this.readOnly,
      this.paddingContainer,
      this.marginContainer,
      this.colorContainer,
      this.maxLength})
      : super(key: key);

  final IconData? icon;
  final Widget? imageAsset;
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Function()? onTap;
  final bool? readOnly;
  final EdgeInsetsGeometry? paddingContainer;
  final EdgeInsetsGeometry? marginContainer;
  final int? maxLength;
  final Color? colorContainer;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      marginContainer: marginContainer,
      paddingContainer: paddingContainer,
      colorContainer: colorContainer,
      child: TextField(
        maxLength: maxLength,
        inputFormatters: [
          LengthLimitingTextInputFormatter(
              textInputType.toString().contains("phone") ? 11 : 255)
        ],
        maxLines: maxLines,
        readOnly: readOnly ?? false,
        cursorColor: AppTheme.primaryColor,
        controller: textEditingController,
        keyboardType: textInputType,
        onTap: onTap,
        decoration: InputDecoration(
            label: Text(
              hint,
              // style: TextStyle(fontSize: appSettingsProvider.fontSize)
            ),
            icon:
                icon != null ? Icon(icon, color: AppTheme.blueGreyDark) : null,
            hintText: hint,
            // hintStyle: TextStyle(fontSize: appSettingsProvider.fontSize),
            counterText: "",
            border: InputBorder.none),
      ),
    );
  }
}
