class PaginateRequest {
  final int pageNumber;
  final int pageSize;

  PaginateRequest({
    required this.pageNumber,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
  }
}
