import 'package:http/http.dart' as http;

class AlbumApi {

  Future<http.Response> fetchAlbum() {
   return http.get(Uri.https("jsonplaceholder.typicode.com","/albums"));
  }
}