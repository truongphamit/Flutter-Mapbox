import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new DiliveryPage(),
    );
  }
}

class DiliveryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiliveryState();
  }
}

class DiliveryState extends State<DiliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: new MapOptions(
                center: new LatLng(21.0286895, 105.8556133), zoom: 18.0, maxZoom: 20.0),
            layers: [
              new TileLayerOptions(
                maxZoom: 20.0,
//          urlTemplate: "https://api.tiles.mapbox.com/v4/"
//              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/mapbox/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoidHJ1b25ncGhhbWl0IiwiYSI6ImNqb2FzbHRncjFzbnUzcXB1MDlid2hiOXgifQ.0us_oBGS155OMV64OMEmDQ',
                  'id': 'light-v9',
                },
              ),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(21.0286895, 105.8556133),
                    builder: (ctx) => new Container(
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(21.0287363, 105.855832),
                    builder: (ctx) => new Container(
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(21.0297208, 105.8556897),
                    builder: (ctx) => new Container(
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: new LatLng(21.029041, 105.856489),
                    builder: (ctx) => new Container(
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: 36.0, right: 36.0, bottom: 12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500),
                          hintText: 'Try \"Coffee\"',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 36.0, right: 36.0, bottom: 12.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Nearby',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18.0),
                      ),
                      Expanded(child: Container()),
                      FlatButton(
                          onPressed: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Favorites',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          )),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.my_location,
                            color: Colors.black,
                            size: 14.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0)))),
                  height: 180.0,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return restaurantItem();
                    },
                    itemCount: 10,
                    viewportFraction: 0.8,
                    scale: 0.9,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget restaurantItem() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://thespaces.com/wp-content/uploads/2018/04/tayone-design-studio-tropical-forest-07-1024x662.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(16.0),
                    bottomStart: Radius.circular(16.0)),
                color: Colors.black12),
            width: 120.0,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Tropical Forest',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text('Drink & coffee',
                    style: TextStyle(color: Colors.black, fontSize: 12.0)),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions,
                      size: 16.0,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('500m',
                        style: TextStyle(color: Colors.black, fontSize: 12.0)),
                  ],
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      size: 16.0,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('\$20-80',
                        style: TextStyle(color: Colors.black, fontSize: 12.0)),
                  ],
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      size: 16.0,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('11 am-10 pm',
                        style: TextStyle(color: Colors.black, fontSize: 12.0)),
                  ],
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.phone_in_talk,
                      size: 16.0,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('+84 12345678',
                        style: TextStyle(color: Colors.black, fontSize: 12.0)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
