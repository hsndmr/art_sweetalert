import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:art_sweetalert/src/art_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/art_dialog_response.dart';

class ArtDialog extends StatefulWidget {
  final ArtDialogArgs artDialogArgs;

  const ArtDialog({Key? key, required this.artDialogArgs}) : super(key: key);

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

//Unnecessary icon variable is removed
  Widget getIcon() {
    if (_icon != null) return _icon!;

    _icon = SizedBox.shrink();
    bool hasIcon = _artDialogArgs.type != null;
    if (hasIcon) {
      switch (_artDialogArgs.type!) {
        case ArtSweetAlertType.success:
          _icon = SuccessIcon(size: _artDialogArgs.sizeSuccessIcon);
          break;

        case ArtSweetAlertType.question:
          _icon = QuestionIcon(size: _artDialogArgs.sizeQuestionIcon);
          break;

        case ArtSweetAlertType.danger:
          _icon = ErrorIcon(size: _artDialogArgs.sizeErrorIcon);
          break;

        case ArtSweetAlertType.info:
          _icon = InfoIcon(size: _artDialogArgs.sizeInfoIcon);
          break;

        case ArtSweetAlertType.warning:
          _icon = WarningIcon(size: _artDialogArgs.sizeWarningIcon);
          break;

        default:
          hasIcon = false;
          break;
      }
    }

    _icon = Container(margin: EdgeInsets.only(bottom: hasIcon ? 12.0 : 0.0), child: _icon);
    return _icon!;
  }

  //Unnecessary text variable is removed
  Widget getTitle() {
    if (_title != null) return _title!;

    _title = _artDialogArgs.title == null
        ? SizedBox.shrink()
        : Text(_artDialogArgs.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(89, 89, 89, 1), fontSize: _artDialogArgs.getTitleSize));

    _title = Container(margin: EdgeInsets.only(bottom: 12.0), child: _title);

    return _title!;
  }

  //Unnecessary text variable is removed
  Widget getText() {
    if (_text != null) return _text!;

    final hasText = _artDialogArgs.text != null;

    _text = hasText
        ? Text(_artDialogArgs.text!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(84, 84, 84, 1), fontSize: 14.0))
        : SizedBox.shrink();

    _text = Container(margin: EdgeInsets.only(bottom: hasText ? 12.0 : 0.0), child: _text);

    return _text!;
  }

  Widget getConfirmButton() {
    if (_confirmButton != null) return _confirmButton!;

    _confirmButton = Container(
      child: ArtButton(
        btnText: _artDialogArgs.confirmButtonText,
        bgColor: _artDialogArgs.confirmButtonColor,
        onTab: () {
          _artDialogResponse.isTapConfirmButton = true;
          //Changed to more useful way instade of whole if-else statement
          _artDialogArgs.onConfirm?.call() ?? Navigator.pop(context, _artDialogResponse);
        },
      ),
    );

    return _confirmButton!;
  }

  Widget getDenyButton() {
    if (_denyButton != null) return _denyButton!;

    _denyButton = Container(
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
              _artDialogArgs.onDeny!;
            }));

    return _denyButton!;
  }

  Widget getCancelButton() {
    if (_cancelButton != null) return _cancelButton!;

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
        },
      ),
    );

    return _cancelButton!;
  }

  // Generated to more efficent way
  void _initCustomColumns() => _customColumns = _artDialogArgs.customColumns?.toList() ?? [];

  void showLoader() => setState(() => _isShowButtons = false);

  void hideLoader() => setState(() => _isShowButtons = true);

  // Generated to more efficent way
  void showErrors(List<String> errors) =>
      setState(() => _errors = errors.map((e) => ArtError(title: e)).toList());

  void closeDialog({Map<String, dynamic>? data}) {
    if (data != null) _artDialogResponse.data = data;

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
    _artDialogArgs.onDispose?.call();
    super.dispose();
  }

  // tree structure Changed for some unnecessary widget and methods
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: _artDialogArgs.dialogElevation,
      child: SingleChildScrollView(
        child: Container(
          padding: _artDialogArgs.dialogPadding,
          decoration: _artDialogArgs.getDialogDecoration(),
          child: Visibility(
            visible: _isShowButtons,
            replacement: CupertinoActivityIndicator(animating: true),
            child: Column(
              mainAxisSize: _artDialogArgs.dialogMainAxisSize,
              children: [
                getIcon(),
                getTitle(),
                getText(),
                ..._customColumns,
                if (_errors.length > 0)
                  Container(
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: _errors)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getConfirmButton(),
                    if (_artDialogArgs.denyButtonText != null) getDenyButton(),
                    if (_artDialogArgs.showCancelBtn) getCancelButton()
                  ],
                ),
              ],
            ),
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

  final EdgeInsets dialogPadding;
  final double dialogElevation;
  final MainAxisSize dialogMainAxisSize;
  final AlignmentGeometry dialogAlignment;
  final DecorationImage? decorationImage;

  final Color barrierColor;

  final List<Widget>? customColumns;

  final Decoration _dialogDecoration;

  //constructor body is changed with more efficent way
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
      this.customColumns,
      this.dialogPadding = const EdgeInsets.all(20),
      Decoration? dialogDecoration,
      this.decorationImage,
      this.dialogElevation = 0.0,
      this.dialogMainAxisSize = MainAxisSize.min,
      this.dialogAlignment = Alignment.center,
      this.barrierColor = const Color.fromRGBO(0, 0, 0, 0.4)})
      : _dialogDecoration = dialogDecoration ??
            BoxDecoration(
                image: decorationImage,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4.0)));

  Decoration getDialogDecoration() => _dialogDecoration;
}
