import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

class ArtButton extends StatefulWidget {


  final Color bgColor;
  final Icon? btnIcon;
  final Function? onTab;
  final String btnText;
  final TextStyle? btnTextStyle;

  const ArtButton(
    {
      Key? key,
      this.bgColor = const Color.fromRGBO(117, 117, 117, 1),
      this.btnIcon,
      this.onTab,
      this.btnText = "OK",
      this.btnTextStyle
    }
  ) : super(key: key);

  @override
  _ArtButtonState createState() => _ArtButtonState();
}

class _ArtButtonState extends State<ArtButton> {


  List<Widget> btnColumns =  <Widget>[];



  void initBtnColumns() {

    Widget button =  Container(
      child: Text(
        widget.btnText,
        style: widget.btnTextStyle ?? TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500
        ),
      ),
    );
    btnColumns.add(
       GestureDetector(
         onTap: () {
           widget.onTab!;
         },
         child: button,
       )
    );
  }
  @override
  void initState() {

    initBtnColumns();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTab!();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: widget.bgColor
        ),
        child: IgnorePointer(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: btnColumns
          ),
        ),
      ),
    );
  }
}
