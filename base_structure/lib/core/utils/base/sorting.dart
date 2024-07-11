class Sort {
  Sort({required this.by, this.order = SortOrder.increasing});

  String by;
  SortOrder order;
}

enum SortOrder {
  increasing,
  decreasing,
}
