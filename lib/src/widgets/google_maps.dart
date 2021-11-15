import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/buttons.dart';

class GoogleMaps extends StatelessWidget {
  final width;
  final height;
  const GoogleMaps({Key key, this.width = 300, this.height = 300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: _Map(),
    );
  }

  // Widget getMap() {
  //   String htmlId = "6";
  //   ui.platform
  //    return HtmlElementView(viewType: viewType)
  // }
}

class _Map extends StatefulWidget {
  const _Map({Key key}) : super(key: key);

  @override
  __MapState createState() => __MapState();
}

class __MapState extends State<_Map> {
  GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
//     if (defaultTargetPlatform == TargetPlatform.android) {
//   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
// }
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(0.0, 0.0), zoom: 11.0),
      markers: {
        Marker(markerId: MarkerId("initial pos"), position: LatLng(0.0, 0.0))
      },
      onMapCreated: (controller) {
        _mapController = controller;
      },
    );
  }
}

Future<LatLng> selectLatLng(BuildContext context) async {
  final response = await showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (context) {
      double width = MediaQuery.of(context).size.width;
      if (width > 600) {
        if (width > 900) {
          width = ((width - 251) / 2) * 0.9;
        } else
          width = (width - 250) * 0.8;
      } else {
        width = width * 0.8;
      }
      return AlertDialog(
        scrollable: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GoogleMaps(
              width: width,
              height: width,
            ),
            SizedBox(height: width * 0.1),
            Container(
              height: width * 0.1,
              width: width * 0.8,
              child: ButtonRounded(
                  text: "Aceptar",
                  onTap: () {
                    Navigator.pop(context, LatLng(0.0, 0.0));
                  },
                  fontSize: width * 0.05),
            ),
          ],
        ),
      );
    },
  );
  if (response is LatLng)
    return response;
  else {
    return null;
  }
}
