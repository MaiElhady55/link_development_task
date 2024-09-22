class Meta {
  int? currentPage;
  int? from;
  int? to;
  int? lastPage;
  int? perPage;
  int? count;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.to,
    this.lastPage,
    this.perPage,
    this.count,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json['current_page'] as int?,
        from: json['from'] as int?,
        to: json['to'] as int?,
        lastPage: json['last_page'] as int?,
        perPage: json['per_page'] as int?,
        count: json['count'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'from': from,
        'to': to,
        'last_page': lastPage,
        'per_page': perPage,
        'count': count,
        'total': total,
      };
}
