import 'package:todo_app/import_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatefulWidget {
  String text;
  Color? fontColor;
  double? fontSize;
  FontWeight? fontWeight;
  int? maxLine;
  bool isRaleway;

  CustomText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontColor,
      this.maxLine,
      this.fontWeight,
      this.isRaleway = false})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      maxLines: widget.maxLine,
      style: widget.isRaleway
          ? GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: widget.fontColor ?? kFontColor,
                  fontSize: widget.fontSize ?? 14.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: widget.fontWeight ?? FontWeight.normal))
          : GoogleFonts.barlow(
              textStyle: TextStyle(
                  color: widget.fontColor ?? kFontColor,
                  fontSize: widget.fontSize ?? 16.sp,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: widget.fontWeight ?? FontWeight.normal)),
    );
  }
}
