import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;

  // الموقع الافتراضي عند فتح الخريطة
  final LatLng _initialPosition = LatLng(37.7749, -122.4194); // سان فرانسيسكو كمثال

  // تحديث الموقع بناءً على اختيار المستخدم
  LatLng? _selectedPosition;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onTap(LatLng position) {
    setState(() {
      _selectedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر موقعك'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 10.0,
            ),
            onTap: _onTap, // استجابة للنقر على الخريطة
            markers: _selectedPosition != null
                ? {
              Marker(
                markerId: MarkerId('selected-location'),
                position: _selectedPosition!,
              ),
            }
                : {},
          ),
          if (_selectedPosition != null)
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  // تنفيذ أي إجراء مثل حفظ الموقع
                  print('الموقع المحدد: $_selectedPosition');
                },
                child: Text('تأكيد الموقع'),
              ),
            ),
        ],
      ),
    );
  }
}
