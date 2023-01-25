import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';

class mappager extends StatefulWidget {
  const mappager({Key? key}) : super(key: key);

  @override
  State<mappager> createState() => _mappagerState();
}

class _mappagerState extends State<mappager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Container(

        child: Column(children: [
      Flexible(child: FlutterMap(options:
      MapOptions(center: LatLng(positionnn!.latitude,positionnn!.longitude),
        zoom:2 ),nonRotatedChildren: [AttributionWidget.defaultWidget(source: 'nistro'
          ,onSourceTapped: null)],layers: [TileLayerOptions(urlTemplate:
      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",subdomains:[
      "a","b","c"],
      userAgentPackageName:"com.example.newnistro"),MarkerLayerOptions(
        markers: [Marker(

            width: 81,height: 81
            ,point: LatLng(positionnn!.latitude,positionnn!.longitude), builder:
            (ctx)=>Icon(Icons.location_on, color: Colors.orange,size: 48,)
        )]
      ),

      ],)
      ),] )),),);
  }
}
