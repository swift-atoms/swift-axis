# swift-axis

Use this package when a value must name one coordinate axis of an `N`-dimensional space by its index, so that an axis of a 2D space cannot be passed where a 3D axis is expected. Start from `Axis<N>`. For the positive or negative sense along an axis, use swift-direction instead.

## Laws

- An `Axis<N>` is exactly an index in `0..<N`; `Axis<0>` has no values. Equality, ordering and hashing are those of the index alone, and `Axis<N>.allCases` lists every axis in ascending index order.
- `Axis<2>.perpendicular(of:)` swaps `.primary` and `.secondary`, so it is an involution. No perpendicular is defined for other dimensions.
- `Axis<N>(ordinal:)` returns `nil` for any ordinal at or beyond `N`, including one too large for `Int`.
- An axis encodes as its bare index, without its dimension. Decoding an index outside `0..<N` fails with `DecodingError.dataCorrupted`.
- Only `Axis<N>(_unchecked:_:)` and `Axis<N>(_unchecked:ordinal:)` can produce an axis outside `0..<N`. They do not check the index, and `Finite.Bound<N>.contains(_:)` reports `false` for such an axis.
