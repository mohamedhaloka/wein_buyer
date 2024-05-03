part of 'LocationAddressImports.dart';

class LocationAddress extends StatefulWidget {
  const LocationAddress({super.key});

  @override
  State<StatefulWidget> createState() => _LocationAddress();
}

class _LocationAddress extends State<LocationAddress> {
  final LocationAddressData locationAddressData = LocationAddressData();

  @override
  void initState() {
    var loc = context.read<LocationCubit>().state.model;
    double lat = loc?.lat ?? 31.037566;
    double lng = loc?.lng ?? 31.38649;
    locationAddressData.locationModel = LocationModel(lat: lat, lng: lng);
    locationAddressData.getLocationAddress(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: locationAddressData._scaffold,
      appBar: AppBar(
        title: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            return Text(
              state.model!.address,
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.primaryColor,
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 20,
            color: AppColors.primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BuildGoogleMapView(
        locationAddressData: locationAddressData,
      ),
      floatingActionButton: MaterialButton(
        color: AppColors.primaryColor,
        child: const Text(
          'حفظ الموقع',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => locationAddressData.changeLocation(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
