class Links {
  dynamic prev;
  String? next;

  Links({this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        prev: json['prev'] as dynamic,
        next: json['next'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'prev': prev,
        'next': next,
      };
}
