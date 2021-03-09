# art_sweetalert

A new sweet alert for flutter. You can show sweet alert in your app.



# A success message

![](https://github.com/hsndmr/art_sweetalert/raw/master/images/success-message.gif)


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

![](https://github.com/hsndmr/art_sweetalert/raw/master/images/question-message.gif)

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

# An error message
![](https://github.com/hsndmr/art_sweetalert/raw/master/images/error-message.gif)
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

![](https://github.com/hsndmr/art_sweetalert/raw/master/images/dialog-message.gif)

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

![](https://github.com/hsndmr/art_sweetalert/raw/master/images/confirm-message.gif)

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

# A message with a custom image
![](https://github.com/hsndmr/art_sweetalert/raw/master/images/image-message.gif)
```


ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        title: "Sweet!",
        text: "Modal with a custom image.",
        customColumns: [
          Container(
            margin: EdgeInsets.only(
                bottom: 12.0
            ),
            child: Image.network(
              "https://unsplash.it/400/200",
            ),

          )
        ]
    )
);


```
