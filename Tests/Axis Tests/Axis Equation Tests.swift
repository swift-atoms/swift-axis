import Axis
import Equation
import Testing

@Suite
struct `Axis Equation Tests` {
    @Test
    func `Axis conforms to Equation Protocol`() {
        func acceptsEquation<T: Equation::Equation.`Protocol`>(_ value: T) -> T { value }

        #expect(acceptsEquation(Axis<3>.secondary) == .secondary)
    }

    @Test
    func `Equation distinguishes axes`() {
        #expect(Axis<2>.primary != Axis<2>.secondary)
        #expect(Axis<3>.primary != Axis<3>.tertiary)
    }
}
