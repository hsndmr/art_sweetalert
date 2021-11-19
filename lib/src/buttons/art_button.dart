import 'package:flutter/material.dart';

class ArtButton extends StatefulWidget {
  final Color bgColor;
  final Icon? btnIcon;
  final Function()? onTab;// variable type ischanged from Function?
  final String btnText;
  final TextStyle? btnTextStyle;
  final double fontSize;

  const ArtButton(
      {Key? key,
      this.bgColor = const Color.fromRGBO(117, 117, 117, 1),
      this.btnIcon,
      this.onTab,
      this.btnText = "OK",
      this.btnTextStyle,
      this.fontSize = 15})
      : super(key: key);

  @override
  _ArtButtonState createState() => _ArtButtonState();
}

class _ArtButtonState extends State<ArtButton> {
  List<Widget> btnColumns = <Widget>[];

  void initBtnColumns() {
    final button = Container(
      child: Text(
        widget.btnText,
        style: widget.btnTextStyle ??
            TextStyle(color: Colors.white, fontSize: widget.fontSize, fontWeight: FontWeight.w500),
      ),
    );
    btnColumns.add(GestureDetector(onTap: widget.onTab, child: button));
  }

  @override
  void initState() {
    initBtnColumns();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTab, //onTap parameter value changed to more efficient way
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)), color: widget.bgColor),
            child:
                IgnorePointer(child: Row(mainAxisSize: MainAxisSize.min, children: btnColumns))));
  }
}
