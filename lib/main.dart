import 'package:flutter/material.dart';
import 'package:sim_racing_fuel/widgets/header.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'SimRacing Fuel Calculator',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double lapTime = 0.0;
  double fuel = 0.0;
  double totalTime = 0.0;
  double fuelRequired = 0.0;
  double additionalLaps = 0.0;

  final lapTimeController = TextEditingController();
  final fuelController = TextEditingController();
  final totalTimeController = TextEditingController();
  final additionalLapController = TextEditingController();

  buttonPressed() {
    lapTime = double.parse(lapTimeController.text);
    fuel = double.parse(fuelController.text);
    totalTime = double.parse(totalTimeController.text);
    additionalLaps = double.parse(additionalLapController.text);
    FocusScope.of(context).requestFocus(new FocusNode());
    setState(() {
      fuelRequired = (((totalTime * 60) / lapTime) + 1) * fuel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            HeaderWidget(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1, 1),
                          spreadRadius: 1)
                    ],
                    color: Color.fromARGB(255, 48, 48, 48)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: FaIcon(
                              FontAwesomeIcons.stopwatch,
                            ),
                          ),
                          Text(
                            "Lap Time in seconds : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: lapTimeController,
                        decoration: new InputDecoration(
                          labelText: "Lap Time (s)",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: FaIcon(FontAwesomeIcons.tint),
                          ),
                          Text(
                            "Fuel Consumption Rate in Litres per Lap : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: fuelController,
                        decoration: new InputDecoration(
                          labelText: "Fuel Cons. (L/lap)",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: FaIcon(
                              FontAwesomeIcons.flagCheckered,
                            ),
                          ),
                          Text(
                            "Total Race Time in Minutes : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: totalTimeController,
                        decoration: new InputDecoration(
                          labelText: "Total Race Time (m)",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 5),
                            child: FaIcon(
                              FontAwesomeIcons.plus,
                            ),
                          ),
                          Text(
                            "Additional Lap for backup fuel : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: additionalLapController,
                        decoration: new InputDecoration(
                          labelText: "Additional Laps",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white30),
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 48, 48, 48)),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: FaIcon(FontAwesomeIcons.gasPump),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Fuel Required (Litres) : "),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text("$fuelRequired L"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 50, left: 50),
                            child: RaisedButton(
                              shape: StadiumBorder(),
                              onPressed: () => {buttonPressed()},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.calculator,
                                  ),
                                  Text(
                                    "Do the math!",
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "© Abhishek Adhikari | Sairyö No Developers",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
