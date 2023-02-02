import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return Scaffold(
      backgroundColor: Colors.black
      ,body: Center(child: Container(
    padding: EdgeInsets.all(1),
        child: Column(children: [
      Container(height: 499,width: 411,//padding: EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius:
        BorderRadius.circular(44), border: Border.all(width: 1,color: Colors.white)),

        child: Flexible(child: Container(
          child: FlutterMap(options:
          MapOptions(center: LatLng(lat!.toDouble(),long!.toDouble()),
            zoom:2 ),nonRotatedChildren: [AttributionWidget.defaultWidget(source: 'nistro'
              ,onSourceTapped: null)],layers: [TileLayerOptions(urlTemplate:
          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",subdomains:[
          "a","b","c"],
          userAgentPackageName:"com.example.newnistro"),MarkerLayerOptions(
            markers: [Marker(

                width: 81,height: 81
                ,point: LatLng(lat!.toDouble(),long!.toDouble()), builder:
                (ctx)=>Icon(Icons.location_on, color: Colors.orange,size: 48,)
            )]
          ),

          ],),
        )
        ),
      ),
  SizedBox(height: 22,),
          Row(
            children: [  SizedBox(width: 11,),
              Text(   '  Location:  $adress' ,style:
              TextStyle(color:
              Colors.white,fontSize: 14),softWrap: false,
             ),
            ],
          )] )),),);
  }
}
