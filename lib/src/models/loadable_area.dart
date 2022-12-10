class BdayaLoadableArea {
  final bool isLoading;
  final String displayName;
  final Object? error;
  final StackTrace? st;
  BdayaLoadableArea({
    this.isLoading = false,
    required this.displayName,
    this.error,
    this.st,
  });

  BdayaLoadableArea copyWith({
    bool? isLoading,
    String? displayName,
    Object? error,
    StackTrace? st,
  }) {
    return BdayaLoadableArea(
      isLoading: isLoading ?? this.isLoading,
      displayName: displayName ?? this.displayName,
      error: error ?? this.error,
      st: st ?? this.st,
    );
  }

  @override
  String toString() {
    return 'BdayaLoadableArea(isLoading: $isLoading, displayName: $displayName, error: $error, st: $st)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BdayaLoadableArea && other.isLoading == isLoading && other.displayName == displayName && other.error == error && other.st == st;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^ displayName.hashCode ^ error.hashCode ^ st.hashCode;
  }
}
