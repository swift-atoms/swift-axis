@_exported public import Finite
@_exported public import Ordinal

extension Axis {
    @inlinable
    public static var finiteBound: Finite.Bound<N> { Finite.Bound() }

    @inlinable
    public init?(ordinal: Ordinal) {
        guard
            let underlying = Int(exactly: ordinal.rawValue),
            let axis = try? Self(underlying)
        else { return nil }

        self = axis
    }
}

extension Finite.Bound {
    @inlinable
    public func contains(_ axis: Axis<N>) -> Bool {
        axis.underlying >= 0 && axis.underlying < N
    }
}
