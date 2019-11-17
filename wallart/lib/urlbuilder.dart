import 'key.dart';

String _baseUrl =
    "https://api.unsplash.com/photos/?client_id=$KEY";

String _searchUrl =
    "https://api.unsplash.com/search/photos/?client_id=$KEY";

String fetchRandoms({
  int limit = 30,
  int page = 1,
}) {
  return _baseUrl + "&per_page=$limit&page=$page";
}

String fetchQuery({
  int limit = 30,
  int page = 1,
  String q = "",
}) {
  if (q != null && q != "") {
    return _searchUrl + "&per_page=$limit&page=$page&query=$q";
  } else {
    return _baseUrl + "&per_page=$limit&page=$page";
  }
}
