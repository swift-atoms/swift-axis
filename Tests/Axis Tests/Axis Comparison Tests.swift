import Axis
import Comparison
import Testing

@Suite
struct `Axis comparison protocols order values by index` {
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
