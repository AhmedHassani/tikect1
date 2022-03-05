class ModelHttp {
  ModelHttp({
    required this.statusCode,
    required this.model,
    required this.error,
  });
  int statusCode;
  dynamic model;
  String error;
}
