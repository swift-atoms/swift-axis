import Axis
import Testing

@Suite
struct `Axis equation protocols distinguish dimension positions` {
    @Test
    func `Axis conforms to Equatable`() {
        func acceptsEquation<T: Swift.Equatable>(_ value: T) -> T { value }

        #expect(acceptsEquation(Axis<3>.secondary) == .secondary)
    }

    @Test
    func `Equation distinguishes axes`() {
        #expect(Axis<2>.primary != Axis<2>.secondary)
        #expect(Axis<3>.primary != Axis<3>.tertiary)
    }
}
