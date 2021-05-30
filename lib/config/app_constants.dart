
class APIConstants {
  // static const String OCTET_STREAM_ENCODING = "application/octet-stream";
  static const String API_BASE_URL = "https://bilalazmat.000webhostapp.com/ecom/";
  static const String BASE_URL = "https://bilalazmat.000webhostapp.com/ecom/";
  // static const int ORGANIZATION_ID_MAIN_BRANCH = 1;
  // static const String ORAGANIZATION_IMAGE_URL = "branches/";
  // static const List<String> ORGANIZATION_SELECTION_FIELDS_LIST = [
  //   "id",
  //   "title",
  //   "branchcode",
  //   "address",
  //   "imageUrl",
  //   "email",
  //   "phone",
  //   "fullSizeImage",
  //   "imageAltText"
  // ];
}


// enum ImageCropState {
//   free,
//   picked,
//   cropped,
// }

// class ImageSelectionConstants {
//   static const int BUSINESS_IMAGE_LIMIT = 5;
//   static const int REALESTATE_IMAGE_LIMIT = 5;
//   static const int RESTAURANT_IMAGE_LIMIT = 5;
//   static const int BUYSELL_IMAGE_LIMIT = 5;
//   static const int JOB_IMAGE_LIMIT = 1;
//   static const String IMAGE_SELECTION_LIMIT_TITLE = "Image Limit";
//   static const String IMAGE_SELECTION_LIMIT_TEXT =
//       "Maximum allowed images limit reached";
//   static const String IMAGE_MULTIPLE_SEPARATER = "|";
// }

// class ImagePlaceholderInfo {
//   static const String IMAGE_NOT_FOUND = "Image not available";
// }

// class AppStartUpConstants {
//   static const int SPLASH_DURATION = 1;
//   static const bool CLOSE_NAVIGATION_DRAWER = false;
// }

// class NetworkConnectivity {
//   static const String NETWORK_NOT_AVAILABLE =
//       "Internet connection is not available";

//   static Future<bool> check() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return true;
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       return true;
//     }
//     return false;
//   }
// }

// class OpenGoogleMapByUri {
//   static openMap(double latitude, double longitude) async {
//     String googleUrl =
//         'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//     if (await canLaunch(googleUrl)) {
//       await launch(googleUrl);
//     } else {
//       throw 'Could not open the map.';
//     }
//   }
// }
