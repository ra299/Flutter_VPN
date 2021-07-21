import 'package:flutter/material.dart';
import 'package:flutter_vpn/utils.dart';
import 'custom_clipper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: [
              upperCurvedContainer(context),
              circularButtonWidget(context)
            ]
          ),
          SizedBox(height: 20),
          connectedStatusText(),
          SizedBox(height: 20),
          locationCard(
            "Random Location",
            Colors.transparent,
            flagUrl,
            "Kenya"
          ),
          SizedBox(height: 40),
          locationCard("Select Location", Colors.purple.shade100, flagUrl2, "Uganda"),

        ]
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget upperCurvedContainer(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 36),
          height: 320,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: curveGradient
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _topRow(),
              Text("It's My VPN", style: vpnStyle),
              _bottomRow()
            ]
          )
    )
    );
  }

  Widget circularButtonWidget(BuildContext context){
    return Positioned(
      bottom: -MediaQuery.of(context).size.width * 0.36,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.50,
            width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.40,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgColor
                ),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.28,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.tealAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0XFF00D58D).withOpacity(.2),
                          spreadRadius: 15,
                          blurRadius: 15
                        )
                      ]
                    ),
                    child: Center(
                      child: Icon(Icons.wifi_lock, color: Colors.white, size: 40)
                    )
                  )
                )
              ),
            )
          ),
          Positioned(
            left: 12,
            top: 30,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(flagUrl),
                radius: 40,
                backgroundColor: Colors.transparent,
              )
            ),
          )
        ]
      )
    );
  }

  Widget connectedStatusText(){
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Status :",
          style: connectedStyle,
          children: [
            TextSpan(text: "Connected\n", style: connectedStyleG),
            TextSpan(text: "00:22:45", style: connectedSubtitle),
          ]
        ),
      )
    );
  }

  Widget locationCard(title, cardBgColor, flag, country){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: locationTitleStyle),
          SizedBox(height: 14.0),
          Container(
            height: 80,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Color(0XFF9881BD),
                style: BorderStyle.solid,
                width: 0.5
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: cardBgColor,
                  radius: 20,
                  backgroundImage: NetworkImage(flag),
                ),
                title: Text(country, style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
                trailing: Icon(
                  Icons.refresh,
                  size: 28,
                  color: Colors.white10,
                )
              )
            )
          )
        ]
      )
    );
  }
}

Widget _topRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
              Image.asset("assets/premiumcrown.png", height: 36),
            SizedBox(width: 12,),
            Text("Go Premium", style: TextStyle( color: Colors.white))
          ],
        )
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.tune,
            size: 26,
            color: Colors.white
          )
        )
      )
    ]
  );
}

Widget _bottomRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      Text("Upload\n546kb/s", style: textStyle),
      Text("Download\n876kb/s", style: textStyle)
    ]
  );
}

