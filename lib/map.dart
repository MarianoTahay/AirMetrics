import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

//PAGINA PARA EL MAPA
class Map extends StatefulWidget {
  const Map({
    super.key,
  });

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final MapController mapController = MapController();
  double latitude = 0;
  double longitud = 0;

  void getLocation() async {
    final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

    try {
      Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        print(position.latitude);
        print(position.longitude);
      });
    } catch (e) {
      print("No se pudo obtener la ubicacion");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          mapController: mapController,
          options: const MapOptions(
              // 14.64072, -90.51327
              initialCenter: LatLng(14.64072, -90.51327),
              initialZoom: 15),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(markers: [
              Marker(
                  width: 40.0,
                  height: 40.0,
                  point: LatLng(latitude, longitud),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ))
            ]),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright')),
                ),
              ],
            ),
          ]),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Row(children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (lat) {
                setState(() {
                  if (lat == "" || lat == "-") {
                    latitude = 14.64072;
                    longitud = -90.51327;
                  } else {
                    latitude = double.parse(lat);
                  }
                  mapController.move(LatLng(latitude, longitud), 15);
                  getLocation();
                });
              },
              decoration: const InputDecoration(labelText: "Latitude"),
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (lon) {
                setState(() {
                  if (lon == "" || lon == "-") {
                    latitude = 14.64072;
                    longitud = -90.51327;
                  } else {
                    longitud = double.parse(lon);
                  }
                  mapController.move(LatLng(latitude, longitud), 15);
                  getLocation();
                });
              },
              decoration: const InputDecoration(labelText: "Longitude"),
            ),
          )
        ]),
      ),
    );
  }
}
