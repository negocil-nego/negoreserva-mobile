import 'organization_response.dart';

class OrganizationPaginate {
  final List<OrganizationResponse> content;
  final bool empty;
  final bool first;
  final bool last;
  final int number;
  final int numberOfElements;
  final int size;
  final int totalElements;
  final int totalPages;

  OrganizationPaginate({
    required this.content,
    required this.empty,
    required this.first,
    required this.last,
    required this.number,
    required this.numberOfElements,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  factory OrganizationPaginate.fromJson(Map<String, dynamic> json) {
    var contentList = <OrganizationResponse>[];
    if (json['content'] != null) {
      contentList = (json['content'] as List)
          .map((e) => OrganizationResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return OrganizationPaginate(
      content: contentList,
      empty: json['empty'] as bool? ?? true,
      first: json['first'] as bool? ?? true,
      last: json['last'] as bool? ?? true,
      number: json['number'] as int? ?? 0,
      numberOfElements: json['numberOfElements'] as int? ?? 0,
      size: json['size'] as int? ?? 0,
      totalElements: json['totalElements'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content.map((e) => e.toJson()).toList(),
      'empty': empty,
      'first': first,
      'last': last,
      'number': number,
      'numberOfElements': numberOfElements,
      'size': size,
      'totalElements': totalElements,
      'totalPages': totalPages,
    };
  }
}
