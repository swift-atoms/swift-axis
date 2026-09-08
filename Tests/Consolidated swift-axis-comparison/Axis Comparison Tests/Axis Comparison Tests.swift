import Axis
import Testing

@Suite
struct `Axis Comparison Integration` {
    @Test
    func `Axis satisfies Comparison Protocol`() {
        func acceptsComparisonProtocol<T: Comparison.`Protocol`>(_ value: T) -> T {
            value
        }

        #expect(acceptsComparisonProtocol(Axis<3>.secondary) == .secondary)
    }

    @Test
    func `Comparison orders axes`() {
        #expect(Comparison(Axis<3>.primary, .secondary) == .less)
        #expect(Comparison(Axis<3>.secondary, .secondary) == .equal)
        #expect(Comparison(Axis<3>.tertiary, .secondary) == .greater)
    }

    @Test
    func `Comparison preserves dimension specific ordering`() {
        #expect(Comparison(Axis<2>.primary, .secondary) == .less)
        #expect(Comparison(Axis<4>.quaternary, .primary) == .greater)
    }
}
