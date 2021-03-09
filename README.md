# art_sweetalert

A new sweet alert for flutter.


# A success message
```
ArtSweetAlert.show(
  context: context,
  artDialogArgs: ArtDialogArgs(
    type: ArtSweetAlertType.success,
    title: "A success message!",
    text: "Show a success message with an icon"
  )
);
```

# A message with title and text
```
ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.question,
        title: "A question?",
        text: "Show a question message with an icon"
    )
);
```

# A error message

```
ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.danger,
        title: "Oops...",
        text: "There is a problem :("
    )
);

```


# A dialog with three buttons

```
ArtDialogResponse response = await ArtSweetAlert.show(
  barrierDismissible: false,
  context: context,
  artDialogArgs: ArtDialogArgs(
    showCancelBtn: true,
    denyButtonText: "Don't save",
    title: "Do you want to save the changes?",
    confirmButtonText: "Save",
  )
);

if(response==null) {
  return;
}

if(response.isTapConfirmButton) {
  ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
      type: ArtSweetAlertType.success,
      title: "Saved!"
    )
  );
  return;
}

if(response.isTapDenyButton) {
  ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
      type: ArtSweetAlertType.info,
      title: "Changes are not saved!"
    )
  );
  return;
}

```

# A confirm dialog

```
ArtDialogResponse response = await ArtSweetAlert.show(
  barrierDismissible: false,
  context: context,
  artDialogArgs: ArtDialogArgs(
    denyButtonText: "Cancel",
    title: "Are you sure?",
    text: "You won't be able to revert this!",
    confirmButtonText: "Yes, delete it",
    type: ArtSweetAlertType.warning
  )
);

if(response==null) {
  return;
}

if(response.isTapConfirmButton) {
  ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Deleted!"
      )
  );
  return;
}


```