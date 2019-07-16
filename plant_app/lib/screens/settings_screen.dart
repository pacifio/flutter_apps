import 'package:flutter/material.dart';
import './colors.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[primaryColor1, secondaryColorGreen],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.only(left: 20.0, bottom: 20.0, right: 20.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: Color(0xFF323643),
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("assets/user.jpg"),
                    )
                  ],
                )),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFFC5CCD6)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width - 40,
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: <Widget>[
            Field(
              fieldName: "Username",
              username: "Paul",
              editable: true,
            ),
            Field(
              fieldName: "Location",
              username: "Milan",
              editable: true,
            ),
            Field(
                fieldName: "E-mail",
                username: "paul.jameson@work.com",
                editable: false),
            Divider(),
            SizedBox(height: 10.0),
            BudgetSlider(),
            MonthlyCapSlider(),
            Divider(),
            Switcher(
              title: "Notifications",
              defVal: true,
            ),
            Switcher(
              title: "Newsletter",
              defVal: false,
            ),
          ],
        ),
      ),
    );
  }
}

class Field extends StatelessWidget {
  final String username;
  final String fieldName;
  final bool editable;

  const Field({Key key, this.username, this.fieldName, this.editable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          fieldName,
          style: TextStyle(
            color: Color(0xFFC5CCD6),
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(username,
                style: TextStyle(color: Color(0xFF323643), fontSize: 16.0)),
            editable
                ? Text("Edit",
                    style: TextStyle(color: Color(0xFF20D29B), fontSize: 16.0))
                : Container(width: 0.0, height: 0.0),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class BudgetSlider extends StatefulWidget {
  BudgetSlider({Key key}) : super(key: key);

  _BudgetSliderState createState() => _BudgetSliderState();
}

class _BudgetSliderState extends State<BudgetSlider> {
  int height = 900;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Budget",
            style: TextStyle(
              color: Color(0xFFC5CCD6),
              fontSize: 16.0,
            )),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 10.0,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
            trackHeight: 8,
          ),
          child: Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 1500.0,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.toInt();
              });
            },
            activeColor: Color(0xFF0AC4BA),
            inactiveColor: Color(0xFF9DA3B4).withOpacity(0.1),
          ),
        )
      ],
    );
  }
}

class MonthlyCapSlider extends StatefulWidget {
  MonthlyCapSlider({Key key}) : super(key: key);

  _MonthlyCapSliderState createState() => _MonthlyCapSliderState();
}

class _MonthlyCapSliderState extends State<MonthlyCapSlider> {
  int height = 900;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Monthly Cap",
            style: TextStyle(
              color: Color(0xFFC5CCD6),
              fontSize: 16.0,
            )),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 10.0,
            ),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
            trackHeight: 8,
          ),
          child: Slider(
            value: height.toDouble(),
            min: 120.0,
            max: 1500.0,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.toInt();
              });
            },
            activeColor: Color(0xFF0AC4BA),
            inactiveColor: Color(0xFF9DA3B4).withOpacity(0.1),
          ),
        )
      ],
    );
  }
}

class Switcher extends StatefulWidget {
  final String title;
  final bool defVal;

  Switcher({Key key, this.title, this.defVal}) : super(key: key);

  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  bool value;

  @override
  void initState() {
    super.initState();

    value = widget.defVal;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          widget.title,
          style: TextStyle(color: Color(0xFFC5CCD6), fontSize: 16),
        ),
        Switch(
          activeColor: Color(0xFF0AC4BA),
          value: value,
          onChanged: (bool onChangedVal) {
            setState(() {
              value = onChangedVal;
            });
          },
        )
      ],
    );
  }
}
