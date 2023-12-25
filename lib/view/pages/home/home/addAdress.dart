
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:taoel_driver_app/core/validation/form_validator.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import 'package:taoel_driver_app/view/widgets/custom_text_feild.dart';

class AddAddress extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<AddAddress> {
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
          title: Text('أضف العنوان'),
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              onTap: _onMapTapped,
                myLocationEnabled: true,
              markers: Set.from(markers),
              initialCameraPosition: const CameraPosition(
              target: LatLng(26.8206, 30.8025),
              zoom: 20,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width/1,
                height: 200.h,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 10.h,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFeild(controller: addressController, type: TextInputType.text, label: 'كتابة العنوان', validat: (value) => FormValidator.mapValidate(context, value),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<HomeCubit>(context).addNewAddress(address: addressController.text, lat: currentLocation!.latitude, lon: currentLocation!.longitude);
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute<void>(
                              //         builder: (BuildContext context) =>
                              //         const LayoutScreen()
                              //     ),
                              //         (route) => false);
                            }
                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                            child: Container(
                             decoration: BoxDecoration(
                               color: Theme.of(context).colorScheme.primary,
                               borderRadius: BorderRadius.circular(8),
                             ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'ارسال موقعك الحالي',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        tappedPoint==null?const SizedBox():GestureDetector(
                          onTap: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<HomeCubit>(context).addNewAddress(address: addressController.text, lat: tappedPoint!.latitude, lon: tappedPoint!.longitude);
                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute<void>(
                                //         builder: (BuildContext context) =>
                                //         const LayoutScreen()
                                //     ),
                                //         (route) => false);
                              }

                          },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'المحدد من الخريطه',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (tappedPoint != null) {
              print('Tapped Point - Lat: ${tappedPoint!.latitude.toString()}, Lng: ${tappedPoint!.longitude}');
            }else{
              print('ERRRRRRRORRRRR');
            }
          },
          child: Icon(Icons.location_pin),
        ),
      ),
    );
  }
}