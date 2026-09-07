public import Cardinal
public import Finite
public import Ordinal

extension Axis::Axis: Finite::Finite.Enumerable {

    @inlinable
    public static var count: Cardinal::Cardinal { Cardinal::Cardinal(UInt(N)) }

    @inlinable
    public var ordinal: Ordinal::Ordinal { Ordinal::Ordinal(UInt(underlying)) }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal::Ordinal) {
        self.init(_unchecked: (), Int(bitPattern: ordinal.rawValue))
    }
}
