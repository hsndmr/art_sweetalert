import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:art_sweetalert/src/art_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArtDialog extends StatefulWidget {
  final ArtDialogArgs artDialogArgs;

  const ArtDialog({
    Key? key,
    required
    this.artDialogArgs
  }) : super(key: key);


  @override
  ArtDialogState createState() => ArtDialogState();
}

class ArtDialogState extends State<ArtDialog> {

  List<Widget> _customColumns = <Widget>[];

  ArtDialogResponse _artDialogResponse = ArtDialogResponse();

  bool _isShowButtons = true;


  late ArtDialogArgs _artDialogArgs;

  Widget? _icon;
  Widget? _title;
  Widget? _text;
  Widget? _confirmButton;
  Widget? _denyButton;
  Widget? _cancelButton;

  List<Widget> _errors = <Widget>[];



  Widget getIcon() {

    if(_icon!=null) {
      return _icon!;
    }

    Widget icon = SizedBox.shrink();
    bool hasIcon = _artDialogArgs.type != null;
    if (hasIcon) {
      switch (_artDialogArgs.type!) {
        case ArtSweetAlertType.success:
          icon = SuccessIcon(
            size: _artDialogArgs.sizeSuccessIcon,
          );
          break;

        case ArtSweetAlertType.question:
          icon = QuestionIcon(
            size: _artDialogArgs.sizeQuestionIcon,
          );
          break;

        case ArtSweetAlertType.danger:
          icon = ErrorIcon(
            size: _artDialogArgs.sizeErrorIcon,
          );
          break;

        case ArtSweetAlertType.info:
          icon = InfoIcon(
            size: _artDialogArgs.sizeInfoIcon,
          );
          break;

        case ArtSweetAlertType.warning:
          icon = WarningIcon(size: _artDialogArgs.sizeWarningIcon);
          break;

        default:
          hasIcon = false;
          break;
      }
    }

    icon = Container(
      margin: EdgeInsets.only(bottom: hasIcon ? 12.0 : 0.0),
      child: icon,
    );
    _icon = icon;
    return icon;
  }

  Widget getTitle() {

    if(_title!=null) {
      return _title!;
    }

    Widget text = SizedBox.shrink();

    if (_artDialogArgs.title != null) {
      text = Text(
        _artDialogArgs.title!,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: _artDialogArgs.titleColor,
            fontSize: _artDialogArgs.getTitleSize),
      );
    }

    text = Container(
      margin: EdgeInsets.only(bottom: 12.0),
      child: text,
    );

    _title = text;

    return text;

  }

  Widget getText() {
    if(_text!=null) {
      return _text!;
    }
    Widget text = SizedBox.shrink();
    bool hasText = _artDialogArgs.text != null;
    if (hasText) {
      text = Text(
        _artDialogArgs.text!,
        textAlign: TextAlign.center,
        style: TextStyle(color: _artDialogArgs.textColor, fontSize: 14.0),
      );
    }

    text = Container(
      margin: EdgeInsets.only(bottom: hasText ? 12.0 : 0.0),
      child: text,
    );
    _text = text;
    return text;
  }

  Widget getConfirmButton() {
    if(_confirmButton!=null) {
      return _confirmButton!;
    }

    _confirmButton =  Container(
      child: ArtButton(
        btnText: _artDialogArgs.confirmButtonText,
        bgColor: _artDialogArgs.confirmButtonColor,
        onTab:  () {

          _artDialogResponse.isTapConfirmButton = true;

          if (_artDialogArgs.onConfirm != null) {
            _artDialogArgs.onConfirm!();
            return;
          }

          Navigator.pop(context, _artDialogResponse);

        },
      ),
    );

    return _confirmButton!;
  }

  Widget getDenyButton() {
    if(_denyButton!=null) {
      return _denyButton!;
    }

    _denyButton =  Container(
      margin: EdgeInsets.only(left: 8.0),
      child: ArtButton(
          btnText: _artDialogArgs.denyButtonText!,
          bgColor: _artDialogArgs.denyButtonColor,
          onTab: () {
            if (_artDialogArgs.onDeny == null) {
              _artDialogResponse.isTapDenyButton = true;
              Navigator.pop(context, _artDialogResponse);
              return;
            }

            _artDialogArgs.onDeny!();
          }),
    );

    return _denyButton!;
  }

  Widget getCancelButton() {

    if(_cancelButton!=null) {
      return _cancelButton!;
    }

    _cancelButton = Container(
      margin: EdgeInsets.only(left: 8.0),
      child: ArtButton(
          bgColor: _artDialogArgs.cancelButtonColor,
          btnText: _artDialogArgs.cancelButtonText,
          onTab: () {
            if (_artDialogArgs.onCancel == null) {
              _artDialogResponse.isTapCancelButton = true;
              Navigator.pop(context, _artDialogResponse);
              return;
            }

            _artDialogArgs.onCancel!();
          }),
    );

    return _cancelButton!;
  }

  void _initCustomColumns() {
    _customColumns = [];

    if (_artDialogArgs.customColumns != null) {
      _artDialogArgs.customColumns!.forEach((element) {
        _customColumns.add(element);
      });
    }
  }

  void showLoader() {
    setState(() {
      this._isShowButtons = false;
    });
  }

  void hideLoader() {
    setState(() {
      this._isShowButtons = true;
    });
  }

  void showErrors(List<String> errors) {
    _errors = <Widget>[];
    errors.forEach((element) {
      _errors.add(ArtError(
        title: element,
      ));
    });
    setState(() {

    });
  }

  void closeDialog({
    Map<String, dynamic>? data
  }) {



    if(data!=null) {
      _artDialogResponse.data = data;
    }

    Navigator.pop(context, _artDialogResponse);
  }

  @override
  void initState() {
    _artDialogArgs = widget.artDialogArgs;
    _initCustomColumns();
    super.initState();
  }

  @override
  void dispose() {
    if(_artDialogArgs.onDispose!=null) {
      _artDialogArgs.onDispose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: _artDialogArgs.dialogElevation,
      child: SingleChildScrollView(
        child: Container(
          padding: _artDialogArgs.dialogPadding,
          decoration: _artDialogArgs.getDialogDecoration(),
          child: Column(
            mainAxisSize: _artDialogArgs.dialogMainAxisSize,
            children: [
              getIcon(),
              getTitle(),
              getText(),
              ..._customColumns,
              if(_errors.length>0) ... [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ..._errors
                    ]
                  ),
                )
              ],
              Visibility(
                  visible: _isShowButtons,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getConfirmButton(),
                        if(_artDialogArgs.denyButtonText != null) ... [
                          getDenyButton()
                        ],
                        if(_artDialogArgs.showCancelBtn) ... [
                          getCancelButton()
                        ]
                      ]
                  )
              ),
              Visibility(
                visible: !_isShowButtons,
                child: Container(
                    child: CupertinoActivityIndicator(animating: true,)
                ),
              )
            ],
          ),
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
  final Function? onDispose;

  //icon sizes
  final double sizeSuccessIcon;
  final double sizeInfoIcon;
  final double sizeWarningIcon;
  final double sizeErrorIcon;
  final double sizeQuestionIcon;

  final double getTitleSize;

  //icon colors
  final Color confirmButtonColor;
  final Color denyButtonColor;
  final Color cancelButtonColor;

  //text colors
  final Color titleColor;
  final Color textColor;

  final EdgeInsets dialogPadding;
  Decoration? dialogDecoration;
  final double dialogElevation;
  final MainAxisSize dialogMainAxisSize;
  final AlignmentGeometry dialogAlignment;
  final DecorationImage? decorationImage;

  final Color barrierColor;

  final List<Widget>? customColumns;

  late Decoration _dialogDecoration;


  ArtDialogArgs(
      {this.sizeSuccessIcon = 50.0,
      this.sizeInfoIcon = 50.0,
      this.sizeWarningIcon = 50.0,
      this.sizeErrorIcon = 50.0,
      this.sizeQuestionIcon = 50.0,
      this.getTitleSize = 18.0,
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
      this.onDispose,
      this.confirmButtonColor = const Color.fromRGBO(115, 103, 240, 1),
      this.denyButtonColor = const Color.fromRGBO(221, 51, 51, 1),
      this.cancelButtonColor = const Color.fromRGBO(117, 117, 117, 1),
      this.titleColor = const Color.fromRGBO(89, 89, 89, 1),
      this.textColor = const Color.fromRGBO(84, 84, 84, 1),
      this.customColumns,
      this.dialogPadding = const EdgeInsets.all(20),
      this.dialogDecoration,
      this.decorationImage,
      this.dialogElevation = 0.0,
      this.dialogMainAxisSize = MainAxisSize.min,
      this.dialogAlignment = Alignment.center,
      this.barrierColor = const Color.fromRGBO(0, 0, 0, 0.4)}) {
    if (dialogDecoration != null) {
      _dialogDecoration = this.dialogDecoration!;
    } else {
      _dialogDecoration = BoxDecoration(
          image: decorationImage,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)));
    }
  }

  Decoration getDialogDecoration() {
    return _dialogDecoration;
  }


}

class ArtDialogResponse {
  bool isTapConfirmButton = false;
  bool isTapDenyButton = false;
  bool isTapCancelButton = false;

  Map<String, dynamic> data = {};

}