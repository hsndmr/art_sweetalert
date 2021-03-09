import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: 12.0
                ),
                child: ArtButton(
                  bgColor: Colors.green,
                  btnText: "a success message",
                  onTab: () {
                    ArtSweetAlert.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                        type: ArtSweetAlertType.success,
                        title: "A success message!",
                        text: "Show a success message with an icon"
                      )
                    );
                  },
                )
              ),
              Container(
                  margin: EdgeInsets.only(
                      bottom: 12.0
                  ),
                  child: ArtButton(
                    bgColor: Colors.blue,
                    btnText: "a message with title and text",
                    onTab: () {
                      ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.question,
                              title: "A question?",
                              text: "Show a question message with an icon"
                          )
                      );
                    },
                  )
              ),
              Container(
                  margin: EdgeInsets.only(
                      bottom: 12.0
                  ),
                  child: ArtButton(
                    bgColor: Colors.red,
                    btnText: "a error message",
                    onTab: () {
                      ArtSweetAlert.show(
                          context: context,
                          artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.danger,
                              title: "Oops...",
                              text: "There is a problem :("
                          )
                      );
                    },
                  )
              ),
              Container(
                  margin: EdgeInsets.only(
                      bottom: 12.0
                  ),
                  child: ArtButton(
                    bgColor: Colors.grey,
                    btnText: "A dialog with three buttons",
                    onTab: () async {
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

                    },
                  )
              ),
              Container(
                  margin: EdgeInsets.only(
                      bottom: 12.0
                  ),
                  child: ArtButton(
                    bgColor: Colors.orange,
                    btnText: "A confirm dialog",
                    onTab: () async {
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


                    },
                  )
              ),
              Container(
                  margin: EdgeInsets.only(
                      bottom: 12.0
                  ),
                  child: ArtButton(
                    bgColor: Colors.grey,
                    btnText: "A message with a custom image",
                    onTab: () async {
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
                    },
                  )
              ),
            ],
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
