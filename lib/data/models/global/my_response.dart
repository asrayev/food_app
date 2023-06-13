class MyResponse {
  MyResponse({
    this.data,
    this.error='',
    this.statusCode
  });

  dynamic data;
  String error = "";
  int? statusCode;
}
