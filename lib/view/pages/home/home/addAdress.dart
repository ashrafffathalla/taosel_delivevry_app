
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taoel_driver_app/core/validation/form_validator.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import 'package:taoel_driver_app/view/widgets/custom_text_feild.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late TextEditingController addressController;
  final _formKey = GlobalKey<FormState>();
  GoogleMapController? mapController;
   LatLng? tappedPoint;
   LatLng? currentLocation;
  Location location = Location();
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getCurrentLocation();
  }

  void _onMapTapped(LatLng point) {
    setState(() {
      tappedPoint = point;
      _addMarker(point);
    });
  }
  List<Marker> markers = <Marker>[];
  void _addMarker(LatLng point) {
    if (mapController != null) {
      final markerId = MarkerId(point.toString());
      markers=[];
      markers.add(
        Marker(
          markerId: markerId,
          position: point,
        ));
    }
  }
  void _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData locationData = await location.getLocation();
    setState(() {
      currentLocation = LatLng(locationData.latitude!.toDouble(), locationData.longitude!.toDouble());
    });

    mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation!));
  }


  @override
  void initState() {
    // TODO: implement initState
    addressController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title:const Text('جاري البحث عن طلبات جديدة'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              onTap: _onMapTapped,
              mapType: MapType.normal,
              myLocationEnabled: true,
              markers: Set.from(markers),
              initialCameraPosition: const CameraPosition(
              target: LatLng(26.8206, 30.8025),
              zoom: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}