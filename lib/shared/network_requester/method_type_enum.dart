enum MethodType {
  get("GET"),
  post("POST"),
  put("PUT"),
  delete("DELETE");

  final String value;
  const MethodType(this.value);
}
