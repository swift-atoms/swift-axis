import Axis_Primitive
import Finite
import Ordinal

extension Axis: Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { Cardinal(integerLiteral: UInt(N)) }

    @inlinable
    public var ordinal: Ordinal { .init(UInt8(underlying)) }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self.init(_unchecked: (), Int(bitPattern: ordinal))
    }
}
