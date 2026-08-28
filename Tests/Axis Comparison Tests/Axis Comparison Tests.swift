import Axis
import Axis_Comparison
import Comparison_Protocol
import Testing

@Suite
struct `Axis Comparison Tests` {
    @Test
    func `Axis conforms to Comparison Protocol`() {
        func acceptsComparison<T: Comparison::Comparison.`Protocol`>(_ value: T) -> T { value }

        #expect(acceptsComparison(Axis<3>.secondary) == .secondary)
    }

    @Test
    func `sorting orders by index`() {
        #expect(
            [Axis<3>.tertiary, .primary, .secondary].sorted() == [.primary, .secondary, .tertiary]
        )
    }
}
