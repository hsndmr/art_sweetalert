
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

class ArtDialog extends StatefulWidget {

  final ArtDialogArgs? artDialogArgs;

  ArtDialog({
    this.artDialogArgs
  });

  @override
  _ArtDialogState createState() => _ArtDialogState();
}

class _ArtDialogState extends State<ArtDialog> {


  // widgets that will show on dialog
  List<Widget> _columns = <Widget>[];

  // widgets for button
  List<Widget> _buttons = <Widget>[];

  ArtDialogResponse _artDialogResponse = ArtDialogResponse();

  ArtDialogArgs artDialogArgs() {
    return widget.artDialogArgs!;
  }

  Widget getIcon() {
    Widget icon = SizedBox.shrink();
    bool hasIcon = artDialogArgs().type!=null;
    if(hasIcon) {
      switch(artDialogArgs().type!) {

        case ArtSweetAlertType.success:
          icon = SuccessIcon(
          );
          break;

        case ArtSweetAlertType.question:
          icon = QuestionIcon();
          break;


        case ArtSweetAlertType.danger:
          icon = ErrorIcon();
          break;

        case ArtSweetAlertType.info:
          icon = InfoIcon(
            size: artDialogArgs().sizeInfoIcon,
          );
          break;

        case ArtSweetAlertType.warning:
          icon = WarningIcon();
          break;

        default:
          hasIcon = false;
          break;

      }
    }

    return Container(
      margin: EdgeInsets.only(
          bottom: hasIcon ? 12.0 : 0.0
      ),
      child: icon,
    );
  }


  Widget getTitle() {

    Widget text =  SizedBox.shrink();

    if(artDialogArgs().title!=null) {
      text = Text(
        artDialogArgs().title!,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(89, 89,89, 1),
            fontSize: 30.0
        ),
      );
    }

     return Container(
       margin: EdgeInsets.only(
         bottom: 12.0
       ),
       child: text,
     );
  }

  Widget getText() {
    Widget text =  SizedBox.shrink();
    bool hasText = artDialogArgs().text!=null;
    if(hasText) {
      text = Text(
        artDialogArgs().text!,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromRGBO(84, 84,84, 1),
            fontSize: 14.0
        ),
      );
    }


    return Container(
      margin: EdgeInsets.only(
          bottom: hasText ? 12.0 : 0.0
      ),
      child: text,
    );
  }

  Widget getConfirmButton() {
    Widget button = ArtButton(
      btnText: artDialogArgs().confirmButtonText,
      bgColor: artDialogArgs().confirmButtonColor,
      onTab: () {

        if(artDialogArgs().onConfirm==null) {
          _artDialogResponse.isTapConfirmButton = true;
          Navigator.pop(context,_artDialogResponse);
          return;
        }

        artDialogArgs().onConfirm!();

      },

    );
    return Container(
      margin: EdgeInsets.only(
        right: 8.0
      ),
      child: button,
    );
  }

  Widget getDenyButton() {
    Widget button = ArtButton(
      btnText: artDialogArgs().denyButtonText!,
      bgColor: artDialogArgs().denyButtonColor,
      onTab: () {

        if(artDialogArgs().onDeny==null) {
          _artDialogResponse.isTapDenyButton = true;
          Navigator.pop(context,_artDialogResponse);
          return;
        }

        artDialogArgs().onDeny!();

      }
    );
    return Container(
      margin: EdgeInsets.only(
          right: 8.0
      ),
      child: button,
    );
  }

  Widget getCancelButton() {
    Widget button = ArtButton(
        bgColor: artDialogArgs().cancelButtonColor,
        btnText: artDialogArgs().cancelButtonText,
        onTab: () {

          if(artDialogArgs().onCancel==null) {
            _artDialogResponse.isTapCancelButton = true;
            Navigator.pop(context,_artDialogResponse);
            return;
          }

          artDialogArgs().onCancel!();

        }
    );
    return Container(
      child: button,
    );
  }

  void initColumns() {


    //icon
    _columns.add(
      getIcon()
    );


    // custom widgets
    if(artDialogArgs().customColumns!=null) {
      artDialogArgs().customColumns!.forEach((element) {
        _columns.add(element);
      });
    }

    //title
    _columns.add(
      getTitle()
    );

    //text
    _columns.add(
      getText()
    );



    //add confirm button to buttons
    _buttons.add(
      getConfirmButton()
    );

    //add deny button to buttons
    if(artDialogArgs().denyButtonText!=null) {
      _buttons.add(
          getDenyButton()
      );
    }

    // add cancel button to buttons
    if(artDialogArgs().showCancelBtn) {
      _buttons.add(
        getCancelButton()
      );
    }

    //add buttons to columns
    Widget buttonsRow = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buttons
    );
    _columns.add(
        buttonsRow
    );




  }

  @override
  void initState() {
    initColumns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        //alignment: Alignment.center,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _columns,
        ),
      ),
    );
  }
}


class ArtDialogArgs {


  final String? title;
  final String? text;

  final bool showCancelBtn;
  final String cancelButtonText;
  final String confirmButtonText;
  final String? denyButtonText;
  final ArtSweetAlertType? type;

  //handle buttons on tap
  final Function? onConfirm;
  final Function? onDeny;
  final Function? onCancel;


  //icon sizes
  final double sizeSuccessIcon = 80.0;
  final double sizeInfoIcon = 80.0;
  final double sizeWarningIcon = 80.0;
  final double sizeErrorIcon = 80.0;

  //icon colors
  final Color confirmButtonColor;
  final Color denyButtonColor;
  final Color cancelButtonColor;


  final List<Widget>? customColumns;

  ArtDialogArgs({
    this.text,
    this.title,
    this.showCancelBtn = false,
    this.cancelButtonText = "Cancel",
    this.confirmButtonText = "OK",
    this.denyButtonText,
    this.type,
    this.onConfirm,
    this.onDeny,
    this.onCancel,
    this.confirmButtonColor =  const Color.fromRGBO(39, 120, 196, 1),
    this.denyButtonColor = const Color.fromRGBO(221, 51, 51, 1),
    this.cancelButtonColor = const Color.fromRGBO(117, 117, 117, 1),
    this.customColumns
  });


}

class ArtDialogResponse {



  bool isTapConfirmButton = false;
  bool isTapDenyButton = false;
  bool isTapCancelButton = false;







}