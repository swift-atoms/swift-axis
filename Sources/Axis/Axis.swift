public struct Axis<let N: Int>: Sendable {

    public let underlying: Int

    @inlinable
    public init(_ underlying: Int) throws(Self.Error) {
        guard underlying >= 0, underlying < N else { throw .outOfBounds(underlying) }
        self.underlying = underlying
    }

    @inlinable
    public init(_unchecked: Void, _ underlying: Int) {
        self.underlying = underlying
    }
}

extension Axis {

    public typealias Error = __AxisError
}

extension Axis: Equatable, Hashable, Comparable {

    @inlinable
    public static func == (lhs: Axis, rhs: Axis) -> Bool {
        lhs.underlying == rhs.underlying
    }

    @inlinable
    public static func < (lhs: Axis, rhs: Axis) -> Bool {
        lhs.underlying < rhs.underlying
    }

    @inlinable
    public static func <= (lhs: Axis, rhs: Axis) -> Bool {
        lhs.underlying <= rhs.underlying
    }

    @inlinable
    public static func > (lhs: Axis, rhs: Axis) -> Bool {
        lhs.underlying > rhs.underlying
    }

    @inlinable
    public static func >= (lhs: Axis, rhs: Axis) -> Bool {
        lhs.underlying >= rhs.underlying
    }

    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(underlying)
    }
}

extension Axis where N == 1 {

    @inlinable
    public static var primary: Self { Self(_unchecked: (), 0) }
}

extension Axis where N == 2 {

    @inlinable
    public static var primary: Self { Self(_unchecked: (), 0) }

    @inlinable
    public static var secondary: Self { Self(_unchecked: (), 1) }

    @inlinable
    public static func perpendicular(of axis: Self) -> Self {
        Self(_unchecked: (), 1 - axis.underlying)
    }

    @inlinable
    public var perpendicular: Self {
        Self.perpendicular(of: self)
    }
}

extension Axis where N == 3 {

    @inlinable
    public static var primary: Self { Self(_unchecked: (), 0) }

    @inlinable
    public static var secondary: Self { Self(_unchecked: (), 1) }

    @inlinable
    public static var tertiary: Self { Self(_unchecked: (), 2) }
}

extension Axis where N == 4 {

    @inlinable
    public static var primary: Self { Self(_unchecked: (), 0) }

    @inlinable
    public static var secondary: Self { Self(_unchecked: (), 1) }

    @inlinable
    public static var tertiary: Self { Self(_unchecked: (), 2) }

    @inlinable
    public static var quaternary: Self { Self(_unchecked: (), 3) }
}
