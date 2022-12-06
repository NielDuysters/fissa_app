import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color =
{
  50:Color.fromRGBO(0, 0, 0, 1.0),
  100:Color.fromRGBO(0, 0, 0, 1.0),
  200:Color.fromRGBO(0, 0, 0, 1.0),
  300:Color.fromRGBO(0, 0, 0, 1.0),
  400:Color.fromRGBO(0, 0, 0, 1.0),
  500:Color.fromRGBO(0, 0, 0, 1.0),
  600:Color.fromRGBO(0, 0, 0, 1.0),
  700:Color.fromRGBO(0, 0, 0, 1.0),
  800:Color.fromRGBO(0, 0, 0, 1.0),
  900:Color.fromRGBO(0, 0, 0, 1.0),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fissa',
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
        primarySwatch: MaterialColor(0xFF000000, color),
      ),
      home: const MyHomePage(title: 'Fissa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(51.260197, 4.402771);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }



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
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: {
          Marker(
              markerId: MarkerId("abc"), // a string for marker unique id,
              icon: BitmapDescriptor.defaultMarker, // options for hues and custom imgs
              position: LatLng(51.233890, 4.403600), // lat and long doubles

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventPage(title: 'Club Vaag');
                }));
              }
          ),
          Marker(
              markerId: MarkerId("xyz"), // a string for marker unique id
              icon: BitmapDescriptor.defaultMarker, // options for hues and custom imgs
              position: LatLng(51.211922, 4.421370), // lat and long doubles

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventPage(title: 'Club Ampere');
                }));
              }
          ),
        },
      ),
    );
  }
}

class EventPage extends StatelessWidget {
  const EventPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/eventpage-background2.jpg"),
              fit: BoxFit.cover),
        ),
        child: new Column(
          children: [
             Text(
              this.title.replaceAll(" ", "\n").toUpperCase(),
              style: TextStyle(fontSize: 72, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 75),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF5F0A87),
                            Color(0xFFA4508B),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                    child: const Text('koop tickets'),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 25),
            OutlinedButton(
              onPressed: null,

              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                  side: MaterialStateProperty.all(BorderSide(
                      color: Colors.white,
                      width: 1.0,
                      style: BorderStyle.solid)),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(65, 10, 65, 10)),
              ),

              child: const Text("meer info", style: TextStyle(fontSize: 24),),
            )
          ],
        )
      )
    );
  }
}




/*
 {
          Marker(
              markerId: MarkerId("1"), // a string for marker unique id,
              icon: BitmapDescriptor.defaultMarker, // options for hues and custom imgs
              position: LatLng(51.233890, 4.403600), // lat and long doubles

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventPage(title: 'MY EVENT');
                }));
              }
          ),
          Marker(
              markerId: MarkerId("2"), // a string for marker unique id
              icon: BitmapDescriptor.defaultMarker, // options for hues and custom imgs
              position: LatLng(51.317960, 4.861350), // lat and long doubles

              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventPage(title: 'MY EVENT');
                }));
              }
          ),
        },
* */